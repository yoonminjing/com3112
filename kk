import random

pygame.init()
white, green, yellow, blue = (255, 255, 255), (0, 255, 0), (255, 255, 102), (50, 153, 213)
width, height, block = 600, 400, 10
screen = pygame.display.set_mode((width, height))
clock = pygame.time.Clock()

def gameLoop():
    x, y, dx, dy, length = width // 2, height // 2, 0, 0, 1
    snake, food = [], [random.randrange(0, width, block), random.randrange(0, height, block)]
    special_food = [random.randrange(0, width, block), random.randrange(0, height, block)]

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT: return
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT: dx, dy = -block, 0
                if event.key == pygame.K_RIGHT: dx, dy = block, 0
                if event.key == pygame.K_UP: dy, dx = -block, 0
                if event.key == pygame.K_DOWN: dy, dx = block, 0

        x, y = (x + dx) % width, (y + dy) % height
        snake.append((x, y))
        if len(snake) > length: del snake[0]

        if (x, y) == tuple(food):
            food = [random.randrange(0, width, block), random.randrange(0, height, block)]
            length += 1
        if (x, y) == tuple(special_food):
            special_food = [random.randrange(0, width, block), random.randrange(0, height, block)]
            length += 2

        screen.fill(blue)
        pygame.draw.rect(screen, green, food + [block, block])
        pygame.draw.rect(screen, yellow, special_food + [block, block])
        for s in snake: pygame.draw.rect(screen, white, s + [block, block])
        pygame.display.flip()
        clock.tick(15)

if __name__ == "__main__":
    gameLoop()
    pygame.quit()
