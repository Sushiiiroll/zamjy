import { OrderService } from './order.service';
import { OrderItem } from '@prisma/client';
export declare class OrderController {
    private readonly order;
    constructor(order: OrderService);
    createOrder(request: OrderItem): Promise<OrderItem>;
}
