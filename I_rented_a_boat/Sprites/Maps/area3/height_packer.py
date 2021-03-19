from PIL import Image
import numpy as np

im_in = Image.open("area3_heightmap.png")
width = im_in.width
height = im_in.height
ori_bmp = np.array(im_in).reshape(width,height,4)
res_bmp = np.full((width,height,4), 255, dtype=np.uint8)

for row in range(height):
     for col in range(width):
        ori_color = int((int(ori_bmp[row,col][0])+int(ori_bmp[row,col][1])+int(ori_bmp[row,col][2]))/3)
        red = ((((ori_color >> 3) & 31)) << 3) & 248
        green = ((ori_color & 7) << 2) & 252
        res_bmp[row,col][0] = red
        res_bmp[row,col][1] = green
        res_bmp[row,col][2] = 0
        res_bmp[row,col][3] = 255
        
im_out = Image.fromarray(res_bmp, "RGBA")
im_out.save("area3_heightmap_ags.png", "PNG")
