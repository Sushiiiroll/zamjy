import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class FileService {
  constructor(private readonly prisma: PrismaService) {}

  async createMenu(data: Prisma.menuCreateInput) {
    return this.prisma.menu.create({ data });
  }
}
