import { User } from '@prisma/client';
import { AuthService } from './auth.service';
export declare class AuthController {
    private readonly authService;
    constructor(authService: AuthService);
    createUser(request: User): Promise<User>;
    loginUser(request: Partial<User>): Promise<User>;
    updateUser(request: Partial<User>, param: {
        id: number;
    }): Promise<User>;
    getUser(param: {
        id: number;
    }): Promise<User>;
}
