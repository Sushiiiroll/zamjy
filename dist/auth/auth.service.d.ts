import { Prisma, User } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
export declare class AuthService {
    private prisma;
    constructor(prisma: PrismaService);
    createUser(data: Prisma.UserCreateInput): Promise<User>;
    loginUser(data: Partial<User>): Promise<{
        id: number;
        fullName: string;
        email: string;
        password: string;
    }>;
    updateUser(data: Prisma.UserUpdateInput, userId: number): Promise<{
        id: number;
        fullName: string;
        email: string;
        password: string;
    }>;
    getUser(id: number): Promise<{
        id: number;
        fullName: string;
        email: string;
        password: string;
    }>;
}
