from PIL import Image
import numpy as np

im_hmap_in = Image.open("title_isle_heightmap.png")
im_cmap_in = Image.open("title_isle_colormap.png")
width = im_hmap_in.width
height = im_hmap_in.height
ori_hmap_bmp = np.array(im_hmap_in).reshape(width,height,4)
ori_cmap_bmp = np.array(im_cmap_in).reshape(width,height,4)
res_bmp = np.full((width,height,4), 255, dtype=np.uint8)

index = 0
txt_out = ""
for row in range(height):
     for col in range(width):
        i_height = int((int(ori_hmap_bmp[row,col][0])+int(ori_hmap_bmp[row,col][1])+int(ori_hmap_bmp[row,col][2]))/3)
        r = ori_cmap_bmp[row,col][0]
        g = ori_cmap_bmp[row,col][1]
        b = ori_cmap_bmp[row,col][2]
        
        r = r >> 3  
        g = g >> 2
        b = b >> 3
  
        r = r << 11
        g = g << 5
        
        r = r & 63488
        g = g & 2016
        b = b & 31
        
        i_color = r+g+b
        
        txt_out = txt_out + "_tiny_heightmap[" + str(index) + "] = " + str(i_height) + ".0;\n"        
        txt_out = txt_out + "_tiny_colormap[" + str(index) + "] = " + str(i_color) + ";\n"
        index=index+1
        

with open("isle_array.txt", "w") as text_file:
    text_file.write(txt_out)
