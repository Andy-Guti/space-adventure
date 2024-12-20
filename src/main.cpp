//
//  rpg_tutorial.cpp
//  SDL Tutorial
//
//  Created by Andy Gutierrez on 4/3/24.
//

#include <stdio.h>
#include <SDL2/SDL.h>
#include <SDL_image.h>
#include <iostream>
#include <vector>

#include "render_window.hpp"
#include "Entity.hpp"
#include "Math.hpp"
#include "Utils.hpp"

int main(int argv, char *args[])
{

    if (SDL_Init(SDL_INIT_VIDEO) > 0)
    {
        std::cout << "SDL_Init has failed :(.... SDL_ERROR: " << SDL_GetError() << std::endl;
    }
    if (!(IMG_Init(IMG_INIT_PNG)))
    {
        std::cout << "IMG_Init has failed :(... SDL_ERROR: " << SDL_GetError() << std::endl;
    }

    RenderWindow window("Space Adventure v0.1", 1280, 720);
    SDL_Texture *grassTexture = window.loadTexture("assets/ground_grass_1.png");
    Vector2f grassVector(40, 40);
    Entity grassEntity(grassVector, grassTexture, 32, 32);

    SDL_Texture *spaceShipTexture = window.loadTexture("assets/enemy_A.png");
    Vector2f spaceShipVector(128, 128);
    Entity spaceShipEntity(spaceShipVector, spaceShipTexture, 128, 128);

    std::vector<Entity> entities;

    entities.push_back(grassEntity);
    entities.push_back(spaceShipEntity);

    bool gameRunning = true;

    SDL_Event event;

    const float timeStep = 0.01f;
    float accumulator = 0.0f;
    float currentTime = utils::hireTimeInSeconds();

    while (gameRunning)
    {

        float newTime = utils::hireTimeInSeconds();
        float frameTime = newTime - currentTime;

        if (frameTime > 0.25)
            frameTime = 0.25;

        currentTime = newTime;

        accumulator += frameTime;

        Vector2f changeDir(0, 0);

        float angle = 0.0;

        int direction = 1;

        while (accumulator >= timeStep)
        {
            while (SDL_PollEvent(&event))
            {
                if (event.type == SDL_QUIT)
                {
                    gameRunning = false;
                }
                else if (event.type == SDL_KEYDOWN)
                {
                    switch (event.key.keysym.sym)
                    {
                    case SDLK_UP:
                        changeDir.changePos(spaceShipEntity.getAngle());
                        // spaceShipEntity.adjustPos(changeDir.x, changeDir.y);
                        break;

                    case SDLK_DOWN:
                        direction = -1;
                        changeDir.changePos(spaceShipEntity.getAngle());
                        // spaceShipEntity.adjustPos(-changeDir.x, -changeDir.y);
                        break;

                    case SDLK_LEFT:
                        // spaceShipEntity.adjustAngle(-2.0);
                        angle = -2.0;
                        break;

                    case SDLK_RIGHT:
                        // spaceShipEntity.adjustAngle(2.0);
                        angle = 2.0;
                        break;
                    }
                }
            }
            accumulator -= timeStep;
        }

        spaceShipEntity.adjustPos(direction * changeDir.x, direction * changeDir.y);

        spaceShipEntity.adjustAngle(angle);

        const float alpha = accumulator / timeStep; // percentage accumulator is at within our timeStep

        window.clear();

        window.render(spaceShipEntity);
        /*
        std::cout << spaceShipEntity.getPos().x;
        for(Entity& entity : entities)
        {
            window.render(entity);
        }
        */
        // std::cout << utils::hireTimeInSeconds() << std::endl;

        window.display();
    }

    window.cleanUp();
    SDL_Quit();

    return 0;
};
