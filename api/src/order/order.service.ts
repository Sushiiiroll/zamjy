import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class OrderService {
  constructor(private readonly prisma: PrismaService) {}

  // async createOrder(data: Prisma.OrderItemCreateInput) {
  //   return await this.prisma.orderItem.create({
  //     data,
  //   });
  // }
}
