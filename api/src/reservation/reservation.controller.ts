import { Body, Controller, Get, Logger, Param, Post } from '@nestjs/common';
import { ReservationService } from './reservation.service';
import { reservation } from '@prisma/client';

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

  @Get('/view/:firstname/:lastname')
  async viewReservation(
    @Param() data: { firstname: string; lastname: string },
  ): Promise<reservation[]> {
    return await this.reservationService.getReservation(data);
  }
}
