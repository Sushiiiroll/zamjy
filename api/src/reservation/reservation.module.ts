import { Logger, Module } from '@nestjs/common';
import { ReservationService } from './reservation.service';
import { ReservationController } from './reservation.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  providers: [ReservationService, PrismaService, Logger],
  controllers: [ReservationController],
})
export class ReservationModule {}
