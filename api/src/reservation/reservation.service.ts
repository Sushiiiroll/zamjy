import { Injectable } from '@nestjs/common';
import { Prisma, account } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ReservationService {
  constructor(private prisma: PrismaService) {}

  async createReservation(data: Prisma.reservationCreateInput) {
    return await this.prisma.reservation.create({
      data,
    });
  }

  async getReservation(data: Partial<account>) {
    return await this.prisma.reservation.findMany({
      where: {
        name: {
          equals: `${data.firstname}, ${data.firstname}`,
        },
      },
    });
  }

  // async createReservation(data: Prisma.ReservationsCreateInput) {
  //   return await this.prisma.reservations.create({
  //     data,
  //   });
  // }
}
