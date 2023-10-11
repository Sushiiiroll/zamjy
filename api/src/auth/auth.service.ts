import { Injectable } from '@nestjs/common';
import { Prisma, account } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class AuthService {
  constructor(private prisma: PrismaService) {}

  async createUser(data: Prisma.accountCreateInput): Promise<account> {
    return this.prisma.account.create({
      data,
    });
  }

  async loginUser(data: Partial<account>) {
    return this.prisma.account.findFirst({
      where: {
        AND: [
          {
            username: data.username,
          },
          {
            password: data.password,
          },
        ],
      },
    });
  }

  async updateUser(data: Prisma.accountUpdateInput, account_id: number) {
    return this.prisma.account.update({
      data: data,
      where: {
        account_id: account_id,
      },
    });
  }

  // async getUser(id: number) {
  //   return this.prisma.user.findUnique({
  //     where: {
  //       id: id,
  //     },
  //   });
  // }
}
