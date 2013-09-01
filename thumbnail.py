import os
import sys

from PIL import Image


THUMB_SIZE = 80, 80


for fn in [f for f in sys.argv[1:] if not 'thumb' in f]:
    img = Image.open(fn)
    width, height = img.size

    if width > height:
       delta = width - height
       left = int(delta/2)
       upper = 0
       right = height + left
       lower = height
    else:
       delta = height - width
       left = 0
       upper = int(delta/2)
       right = width
       lower = width + upper

    img = img.crop((left, upper, right, lower))
    img.thumbnail(THUMB_SIZE, Image.ANTIALIAS)

    base, ext = os.path.splitext(fn)
    print(ext)
    img.save('{}{}{}'.format(base, '_thumb', ext))
