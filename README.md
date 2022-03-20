# I Rented a Boat

Made in Adventure Game Studio for MAGS Journey theme

![Title Screen](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/readme/title_screen.gif)

[itch.io page](https://eri0o.itch.io/i-rented-a-boat) | [AGS DB](https://www.adventuregamestudio.co.uk/site/games/game/2530-i-rented-a-boat/) | [AGS Forum Thread](https://www.adventuregamestudio.co.uk/forums/index.php?topic=58996.0) | [Making of](https://github.com/ericoporto/i_rented_a_boat/blob/main/README.md#making-of)

![water](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/readme/water.gif)

## Making of

_originally published in the [Adventure Game Studio Forums](https://www.adventuregamestudio.co.uk/forums/index.php?topic=58996.msg636634808#msg636634808)_

![](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/post/00_open.png)

Hi,

I decided to talk a bit about how the maps got made in this game! I did this game during late nights, and my interaction with it was me using headphones and a bright screen.

![](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/post/01_theme.png) ![](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/post/02_first_design.png)

Slasher and Racoon have set a good theme for this MAGS. The Journey game imagery compelled me to experiment with the idea of something on the horizon that you would walk to and a bit with the idea of feeling small.

I pick Firewatch Talkie as a way to avoid having to draw sprites for the characters, that could also not blend well with the world, and that the world had to be on an island to work in time constraint - the island would give me "natural" walls. On the same day, I saw by coincidence a little guide on Voxel Space engine on GitHub, and it felt reasonably simple to put it up together. Finally, one of my favorite games was Proteus, which had simple colors and gameplay, so I thought I could get away if I had to simplify drawing a lot.

I did this design about obelisks at a distance, and you would had this walk talkie which would need you to collect batteries, so I threw up a super tiny prototype of the idea and showed it to a close friend. He told me it was trash, but he had this idea of a radio tower and you finding a signal opposite to it so that you would walk away instead of close to it. In my head, the aesthetic was reverse Dear Esther, and I liked the little idea.

So at this point, I decided I would make a game where you are on this island with a radio that can pick up signals. I think about how I want the game to work:
you walk in basically 2D space,
go to a destination you see at a distance,
find a goal,
reach a dead-end,
backtrack,
and then you go to an open area where the game can happen.

![](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/post/03_geomorph.png) ![](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/post/04_terresculptor.png)

To make this, I need tools, so my first tool is the software geomorph, it's only available for Linux, and it allows drawing a heightmap while seeing a preview of it in 3D at the same time. Other heightmap tools I found worked with automatic generation of environment, and this was the only tool that I found to handmade things. I made all maps in it first.

Next, I used a tool called TerreSculptor, in which I would use two features: generating a colorset bitmap from a heightmap and previewing a heightmap with a colormap in 3D.

The colorset generated bitmaps would be the base environments which I would then use Krita to draw on top to create the textures, like the river, the little tree/bushes, some tracks in the grass, and so on.

![](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/post/05_krita_brushes.png) ![](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/post/07_gmic.png)

Krita was my main tool when sculpting the maps! Using its interesting brushes and layers, I would test where to place each thing, rendering on TerreSculptor, and much more often, on AGS itself, because I had to walk around and feel the level.

These steps were figured out in the first week of development, with AGS Room Editor repurposed so I could iterate and test ideas.

In the first weekend, I managed to send a build to Heltenjon, with only the first area working. It takes forever for GetPixel to happen, so I throw a CYOA intro just so the games load while you play it - I don't remember if this was already in the first build I sent out. Heltenjon returns to me super quickly, and his main criticism (beyond the game still making no sense) is that the render looks too crap. I tune it until it appears a little more normal, sends him a new build (I think Sunday?), and then he answers me back that this render is a bit more alright. Good, I can work on my game to finish now. I also send MorganW a build, and he gives me input on the CYOA bits as the actual game, which I would try to address - originally, all characters had the same font, text position, and the colors were more similar and this was confusing.

After looking a lot at the first Journey image, I want to put the following experience in the game:
You hear about a thing.
You see the thing in a distance.
You walk towards it and get a reward once you reach it.
And the thing is the lighthouse mountain, and the reward is verticality or the view.

![](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/post/06_spiral_mountain.png)

Drawing and testing the position of the mountain ate a week of development. It had to feel natural to walk up the mountain. In the end, a spiral shape gave me an experience that felt like flying down the hill in A Short Hike - and also, this gave me the idea of making the sky that changes with height.

By now, I start to work with sound. I make so that waves sound closer to water are louder and that going upwards on the mountain makes the world quieter - so you wait in silence for the balloon. And I use math from Zelda Wind Waker water to use in the game water. By now, it's half of the MAGS, and I have different interesting experiences but need to make a game.

![](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/post/08_aseprite.png) ![](https://raw.githubusercontent.com/ericoporto/i_rented_a_boat/main/docs/post/09_ags.png)

So I alternate between polishing the colors and colormap in Krita and placing the final puzzle elements using Aseprite. I also used Aseprite to do detailed corrections in the heightmap.

During the third week, I want to project sprites, have ideas with FPS mechanics, and frantically watch Duke Nuken and Doom Engine videos, but I go nowhere. I make the game menus and the title screen to pass the time. The sprite projection code ends up being a concise ten-line code, and I can't find a good way to deal with z-ordering without butchering frames.

Last week now, I added the final puzzle elements on the island, have both ends, and send a build to Heltenjon. He asks me about adding an objectives interface and can't finish the game—too little time to work on geometries now. I finish up the writing on the story, wrap up tweaking the ending scene, and finish the game. It was a weird pace of development, but it was done and felt like a game.

Time to work on a new game!
