import { Body, Controller, Post } from '@nestjs/common';
import { OrderService } from './order.service';
import { OrderItem } from '@prisma/client';

@Controller('order')
export class OrderController {
  constructor(private readonly order: OrderService) {}

  @Post('/create')
  async createOrder(@Body() request: OrderItem): Promise<OrderItem> {
    return this.order.createOrder(request);
  }
}
