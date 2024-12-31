import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np
import random
from tqdm import tqdm

fig, ax = plt.subplots(figsize=(5, 4))
redx, redy = [], []
bluex, bluey = [], []

def update(frame):
    xrand = np.array([random.random() for i in range(100)])
    yrand = np.array([random.random() for i in range(100)])

    for x, y in zip(xrand, yrand):
        if np.sqrt(x**2+y**2)>1:
            bluex.append(x)
            bluey.append(y)
        elif np.sqrt(x**2+y**2)<=1:
            redx.append(x)
            redy.append(y)
    ax.scatter(
        redx, redy, marker='.', c='red')
    ax.scatter(
        bluex, bluey, marker='.', c='blue')
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1)
    ax.set_title(f'Approximation:{"%.6f" % round(4*len(redx)/(len(redx)+len(bluex)), 6)}, frame#{frame}')
    # print (f'red = {len(redx)} \n blue = {len(bluex)}')
    return fig, ax

ani = animation.FuncAnimation(fig, 
                              update, 
                              frames=range(100), 
                              interval = 100 # in ms
                              )

# plt.show()
with tqdm(total=100, desc="Saving animation", unit="frame") as pbar:
    ani.save('/Users/alisonandrade/Documents/alison18/github/Portfolio/1_Python/7_approximating_pi/animation.gif', writer='imagemagick', progress_callback=lambda i, n: pbar.update(1))