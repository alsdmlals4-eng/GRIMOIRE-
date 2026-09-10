"""Approved local cutout preparation; keep model output and write a new candidate."""
from pathlib import Path
import os
import argparse

ROOT = Path(__file__).resolve().parents[1]
os.environ['U2NET_HOME'] = str(ROOT / '.tooling/blueprint-image-tools/models')

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('names', nargs='+', choices=['peer', 'peer-style', 'tutor'])
    args = parser.parse_args()
    from rembg import remove, new_session
    from PIL import Image
    session = new_session('u2netp')
    for name in args.names:
        source = ROOT / 'output/imagegen/blueprint-20260911' / f'{name}.png'
        output = source.with_name(f'{name}-alpha.png')
        if output.exists():
            raise FileExistsError(output)
        result = remove(Image.open(source), session=session)
        result.save(output)
        alpha = result.getchannel('A')
        print(name, result.size, alpha.getextrema(), 'transparent_pixels', alpha.histogram()[0])

if __name__ == '__main__':
    main()
