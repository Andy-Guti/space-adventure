//
//  rpg_tutorial.cpp
//  SDL Tutorial
//
//  Created by Andy Gutierrez on 4/3/24.
//

#include <stdio.h>
#include <SDL2/SDL.h>
#include <SDL2_image/SDL_image.h>
#include <iostream>
#include <vector>

#include "render_window.hpp"
#include "Entity.hpp"
#include "Math.hpp"

#include "Utils.hpp"

int main(int argv, char* args[])
{
    
    if(SDL_Init(SDL_INIT_VIDEO) > 0)
    {
        std::cout << "SDL_Init has failed :(.... SDL_ERROR: " << SDL_GetError() << std::endl;
    }
    if (!(IMG_Init(IMG_INIT_PNG)))
    {
        std::cout << "IMG_Init has failed :(... SDL_ERROR: " << SDL_GetError() << std::endl;
    }
    
    RenderWindow window("Game v1.0", 1280, 720);
    SDL_Texture* grassTexture = window.loadTexture("res/pngs/ground_grass_1.png");
    Vector2f grassVector(40,40);
    Entity grassEntity(grassVector, grassTexture, 32, 32);
    
    SDL_Texture* spaceShipTexture = window.loadTexture("PNG/Default/enemy_A.png");
    Vector2f spaceShipVector(100,100);
    Entity spaceShipEntity(spaceShipVector,spaceShipTexture,64,64);
    
    std::vector<Entity> entities;
    
    entities.push_back(grassEntity);
    entities.push_back(spaceShipEntity);
    
    bool gameRunning = true;
    
    SDL_Event event;
    
    const float timeStep = 0.01f;
    float accumulator = 0.0f;
    float currentTime = utils::hireTimeInSeconds();
    
    while(gameRunning)
    {
        
        float newTime = utils::hireTimeInSeconds();
        float frameTime = newTime - currentTime;
        
        if (frameTime > 0.25)
            frameTime = 0.25;
        
        currentTime = newTime;
        
        accumulator += frameTime;
        
        while (accumulator >= timeStep)
        {
            while(SDL_PollEvent(&event))
            {
                if(event.type == SDL_QUIT)
                {
                    gameRunning = false;
                }
                else if(event.type == SDL_KEYDOWN)
                {
                    switch(event.key.keysym.sym)
                    {
                        case SDLK_UP:
                        spaceShipEntity.adjustPos(0.0, 1.0);
                        break;
                        
                        case SDLK_DOWN:
                        spaceShipEntity.adjustPos(0.0, -1.0);
                        break;
                            
                        case SDLK_LEFT:
                        spaceShipEntity.adjustPos(-1.0, 0.0);
                        break;
                            
                        case SDLK_RIGHT:
                        spaceShipEntity.adjustPos(1.0, 0.0);
                        break;
                    }
                    
                }
            }
            accumulator -= timeStep;
        }
        
        const float alpha = accumulator / timeStep; //percentage accumulator is at within our timeStep
        
        
        window.clear();
        
        window.render(spaceShipEntity);
        /*
        std::cout << spaceShipEntity.getPos().x;
        for(Entity& entity : entities)
        {
            window.render(entity);
        }
        */
        //std::cout << utils::hireTimeInSeconds() << std::endl;
        
        window.display();
        
        
        
        
    }
    
    window.cleanUp();
    SDL_Quit();
    
    return 0;
};
