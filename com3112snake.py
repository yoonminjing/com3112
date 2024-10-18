import pygame

pygame.init()

screen = pygame.display.set_mode((400,200))
pygame.display.set_caption("Snake Game ver 1.0")
pygame.display.update()

running = True
while running:
    for event in pygame.event.get() :
            print (event)

#pygame.quit()
