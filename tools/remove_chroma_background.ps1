param([Parameter(Mandatory)][string]$Source, [Parameter(Mandatory)][string]$Output)
# User-requested deterministic chroma removal; never for painted checkerboards.
$ErrorActionPreference = 'Stop'
if ($PSVersionTable.PSEdition -eq 'Core') { throw 'Run with Windows powershell.exe (5.1), which supplies System.Drawing for this local pipeline.' }
$inputPath = (Resolve-Path -LiteralPath $Source).Path
$outputPath = [IO.Path]::GetFullPath($Output)
if (Test-Path -LiteralPath $outputPath) { throw 'Refusing to overwrite an existing cutout.' }
Add-Type -AssemblyName System.Drawing
Add-Type -ReferencedAssemblies System.Drawing -TypeDefinition @'
using System;
using System.Drawing;
using System.Drawing.Imaging;
public static class GrimoireChroma {
    public static string Convert(string input, string output) {
        using (var src = new Bitmap(input))
        using (var dst = new Bitmap(src.Width, src.Height, PixelFormat.Format32bppArgb)) {
            long clear=0, soft=0, solid=0; int minX=src.Width,minY=src.Height,maxX=-1,maxY=-1;
            // Background must actually be vivid green at all four corners.
            foreach (var point in new[]{new Point(0,0),new Point(src.Width-1,0),new Point(0,src.Height-1),new Point(src.Width-1,src.Height-1)}) {
                var c=src.GetPixel(point.X,point.Y);
                if (c.G < 180 || c.G-Math.Max(c.R,c.B)<120) throw new Exception("Input is not an isolated green-screen source.");
            }
            for(int y=0;y<src.Height;y++) for(int x=0;x<src.Width;x++) {
                Color c=src.GetPixel(x,y); int a=255,g=c.G;
                int excess=c.G-Math.Max(c.R,c.B);
                if(excess>35) {
                    a=(int)Math.Round(255*Math.Max(0,1-(excess-35)/140.0));
                    // Despill only pixels selected by the key, not all teal clothing.
                    g=Math.Min(g,Math.Max(c.R,c.B));
                }
                if(a==0) { clear++; dst.SetPixel(x,y,Color.FromArgb(0,0,0,0)); }
                else {
                    if(a==255) solid++; else soft++;
                    dst.SetPixel(x,y,Color.FromArgb(a,c.R,g,c.B));
                    minX=Math.Min(minX,x);minY=Math.Min(minY,y);maxX=Math.Max(maxX,x);maxY=Math.Max(maxY,y);
                }
            }
            if(clear==0 || solid==0) throw new Exception("Empty foreground or no transparency.");
            dst.Save(output,ImageFormat.Png);
            return String.Format("width={0} height={1} transparent={2} partial={3} opaque={4} bounds={5},{6},{7},{8}",src.Width,src.Height,clear,soft,solid,minX,minY,maxX,maxY);
        }
    }
}
'@
[GrimoireChroma]::Convert($inputPath, $outputPath)
Get-FileHash -LiteralPath $inputPath,$outputPath -Algorithm SHA256
