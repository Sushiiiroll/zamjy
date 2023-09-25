import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
export declare class ReservationService {
    private prisma;
    constructor(prisma: PrismaService);
    createReservation(data: Prisma.ReservationsCreateInput): Promise<{
        id: number;
        totalGuest: string;
        reservedBy: number;
        date: string;
        time: string;
        gcashReceipt: string;
    }>;
}
