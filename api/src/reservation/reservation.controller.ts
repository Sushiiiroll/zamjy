import { Body, Controller, Logger, Post } from '@nestjs/common';
import { ReservationService } from './reservation.service';
import { Reservations } from '@prisma/client';

@Controller('reservation')
export class ReservationController {
  constructor(
    private readonly reservationService: ReservationService,
    private readonly log: Logger,
  ) {}

  @Post('/create')
  async createReservation(
    @Body() request: Reservations,
  ): Promise<Reservations> {
    this.log.log(request);
    return await this.reservationService.createReservation(request);
  }
}
