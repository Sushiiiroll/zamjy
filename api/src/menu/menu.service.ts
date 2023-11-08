import { Injectable } from '@nestjs/common';
import { menu } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class MenuService {
  constructor(private readonly prisma: PrismaService) {}

  async getAllProducts(): Promise<Array<menu>> {
    return this.prisma.menu.findMany();
  }
}
