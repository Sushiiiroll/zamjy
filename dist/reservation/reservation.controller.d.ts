import { Logger } from '@nestjs/common';
import { ReservationService } from './reservation.service';
import { Reservations } from '@prisma/client';
export declare class ReservationController {
    private readonly reservationService;
    private readonly log;
    constructor(reservationService: ReservationService, log: Logger);
    createReservation(request: Reservations): Promise<Reservations>;
}
