import { HttpInterceptorFn } from '@angular/common/http';
import { environment } from '../../environments/environment';

export const apiUrlInterceptor: HttpInterceptorFn = (req, next) => {
  const apiReq = req.clone({
    url: environment.apiURL + req.url
  });

  return next(apiReq);
};
