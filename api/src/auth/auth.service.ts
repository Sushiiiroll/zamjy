import { Injectable } from '@nestjs/common';
import { Prisma, User } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class AuthService {
  constructor(private prisma: PrismaService) {}

  async createUser(data: Prisma.UserCreateInput): Promise<User> {
    return this.prisma.user.create({
      data,
    });
  }

  async loginUser(data: Partial<User>) {
    return this.prisma.user.findFirst({
      where: {
        AND: [
          {
            email: data.email,
          },
          {
            password: data.password,
          },
        ],
      },
    });
  }

  async updateUser(data: Prisma.UserUpdateInput, userId: number) {
    return this.prisma.user.update({
      data: data,
      where: {
        id: userId,
      },
    });
  }

  async getUser(id: number) {
    return this.prisma.user.findUnique({
      where: {
        id: id,
      },
    });
  }
}
