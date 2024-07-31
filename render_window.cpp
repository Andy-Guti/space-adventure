//
//  render_window.cpp
//  SDL Tutorial
//
//  Created by Andy Gutierrez on 4/3/24.
//
#include <SDL2/SDL.h>
#include <SDL2_image/SDL_image.h>
#include <iostream>

#include "render_window.hpp"
#include "Entity.hpp"

RenderWindow::RenderWindow(const char* title, int width, int height)
    :window(NULL), renderer(NULL)
{
    window = SDL_CreateWindow(title, SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, width, height, SDL_WINDOW_SHOWN);
    if(window == NULL){
        std::cout << "Window failed to init. Error: " << SDL_GetError() << std::endl;
    }
    
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
}

SDL_Texture* RenderWindow::loadTexture(const char* filePath)
{
    SDL_Texture* texture = NULL;
    texture = IMG_LoadTexture(renderer, filePath);
    
    if(texture == NULL)
    {
        std::cout << "Failed to load texture. Error: " << SDL_GetError() << std::endl;
    }
    
    return texture;
}

void RenderWindow::cleanUp()
{
    SDL_DestroyWindow(window);
}

void RenderWindow::clear()
{
    SDL_RenderClear(renderer);
}

void RenderWindow::render(Entity& entity)
{
    
    SDL_Rect src;
    src.x = entity.getCurrentFrame().x;
    src.y = entity.getCurrentFrame().y;
    src.w = entity.getCurrentFrame().w;
    src.h = entity.getCurrentFrame().h;
    
    SDL_Rect dst;
    dst.x = entity.getPos().x * 4;
    dst.y = entity.getPos().y * 4;
    dst.w = entity.getCurrentFrame().w * 4;
    dst.h = entity.getCurrentFrame().h * 4;
    
    int render_cpy = SDL_RenderCopy(renderer, entity.getTexture(), &src, &dst);
    if( render_cpy !=0)
    {
        std::cout << "Render Copy failed with Error: " << SDL_GetError() << std::endl;
    }
    
}

void RenderWindow::display()
{
    SDL_RenderPresent(renderer);
}
