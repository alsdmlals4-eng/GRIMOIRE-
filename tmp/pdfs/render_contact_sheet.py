from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
root = Path(r"C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-\tmp\pdfs\grimoire_hgb_20260830_render")
pages = sorted(root.glob("page-*.png"), key=lambda p: int(p.stem.split("-")[-1]))
thumb_w = 320
thumb_h = 227
cols = 4
rows = (len(pages) + cols - 1) // cols
canvas = Image.new("RGB", (cols * thumb_w, rows * (thumb_h + 24)), "#2A3552")
draw = ImageDraw.Draw(canvas)
for index, path in enumerate(pages):
    image = Image.open(path).convert("RGB")
    image.thumbnail((thumb_w - 8, thumb_h - 8))
    x = (index % cols) * thumb_w + (thumb_w - image.width) // 2
    y = (index // cols) * (thumb_h + 24) + 4 + (thumb_h - image.height) // 2
    canvas.paste(image, (x, y))
    draw.text(((index % cols) * thumb_w + 8, (index // cols) * (thumb_h + 24) + thumb_h + 3), f"Page {index + 1}", fill="white")
out = root / "contact-sheet.png"
canvas.save(out, "PNG")
print(out)
