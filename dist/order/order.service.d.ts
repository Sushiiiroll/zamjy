import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
export declare class OrderService {
    private readonly prisma;
    constructor(prisma: PrismaService);
    createOrder(data: Prisma.OrderItemCreateInput): Promise<{
        id: number;
        orderBy: number;
        orderTitle: string;
        orderPrice: string;
        orderImage: string;
    }>;
}
