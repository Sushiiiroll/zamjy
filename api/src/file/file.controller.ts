import {
  Controller,
  Post,
  UploadedFile,
  UseInterceptors,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import * as fs from 'node:fs/promises';
import * as path from 'node:path';

@Controller('file')
export class FileController {
  @Post('upload')
  @UseInterceptors(FileInterceptor('file'))
  async uploadFile(@UploadedFile() file: Express.Multer.File) {
    console.log(file);
    const fileStorageDir = await fs.opendir('file-storage');
    await fs
      .writeFile(
        path.basename(fileStorageDir.path) + '/' + file.originalname,
        file.buffer,
      )
      .finally(() => {
        fileStorageDir.closeSync();
      });
  }
}
