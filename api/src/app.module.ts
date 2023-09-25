import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { ReservationModule } from './reservation/reservation.module';
import { OrderModule } from './order/order.module';

@Module({
  imports: [AuthModule, ReservationModule, OrderModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}