import { Controller, Get } from '@nestjs/common';
import { menu } from '@prisma/client';
import { MenuService } from './menu.service';

@Controller('menu')
export class MenuController {
  constructor(readonly menuService: MenuService) {}

  @Get('all-products')
  async getAllProducs(): Promise<Array<menu>> {
    return await this.menuService.getAllProducts();
  }
}
