import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { User } from '@prisma/client';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('/signup')
  async createUser(@Body() request: User): Promise<User> {
    return this.authService.createUser(request);
  }

  @Post('/login')
  async loginUser(@Body() request: Partial<User>): Promise<User> {
    return this.authService.loginUser(request);
  }

  @Post('/update/:id')
  async updateUser(
    @Body() request: Partial<User>,
    @Param() param: { id: number },
  ): Promise<User> {
    return this.authService.updateUser(request, parseInt(param.id.toString()));
  }

  @Get('/find/:id')
  async getUser(@Param() param: { id: number }): Promise<User> {
    return this.authService.getUser(parseInt(param.id.toString()));
  }
}
