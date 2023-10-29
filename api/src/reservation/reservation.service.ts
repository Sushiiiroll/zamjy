import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ReservationService {
  constructor(private prisma: PrismaService) {}

  async createReservation(data: Prisma.reservationCreateInput) {
    return await this.prisma.reservation.create({
      data,
    });
  }

  async getReservation(data: { firstname: string; lastname: string }) {
    return await this.prisma.reservation.findMany({
      where: {
        name: {
          equals: `${data.firstname}, ${data.lastname}`,
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
