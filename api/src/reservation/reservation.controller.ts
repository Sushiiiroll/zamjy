import { Body, Controller, Get, Logger, Post } from '@nestjs/common';
import { ReservationService } from './reservation.service';
import { account, reservation } from '@prisma/client';

@Controller('reservation')
export class ReservationController {
  constructor(
    private readonly reservationService: ReservationService,
    private readonly log: Logger,
  ) {}

  @Post('/create')
  async createReservation(@Body() request: reservation): Promise<reservation> {
    return await this.reservationService.createReservation(request);
  }

  @Get('/view')
  async viewReservation(
    @Body() request: Partial<account>,
  ): Promise<reservation[]> {
    return await this.reservationService.getReservation(request);
  }
}
