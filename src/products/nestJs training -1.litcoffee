
interceptor:
Interceptors are a powerful feature in Nest.js that allow you to intercept and manipulate the flow of data in your application. 
They can be used to perform various tasks such as logging, caching, transforming data, and handling errors. 
Interceptors are executed before and after the execution of a route handler, allowing you to modify the request and response objects.

1 . Logging: 
2. Caching:
3. Transforming data:
4. Handling errors:
5 . Performance monitoring:

preprocessing phase
postprocessing phase

console.log('Before, This is a log message');
const observable = next.handle();
//routehandler is executed//
return observable.pipe(
  console.log('After, This is a log message')
);

caching 
errormapping
logging: 
response-transforming
Retry 
serialize

logging: 
Tap () operator from RxJS can be used to perform side effects such as logging without affecting the data stream.

response-transforming: 
map () operator can be used to transform the response data before it is sent back to the client.



logging: Interceptors can be used to log the details of incoming requests and outgoing responses, 
which can be helpful for debugging and monitoring the application.


nestjs lifecycle hooks:
1. OnModuleInit: .


http://localhost:3000/store/products?category=Electronics

controllers  
services
dependency injections

- one request it goes to multiple layers it will not come in direct 

controllers  
services
dependency injections

- one request it goes to multiple layers it will not come in direct 

request -> middleware -> guard -> pipe -> controller -> service -> response

- controller is responsible for handling incoming requests and returning responses to the client. 
It acts as an intermediary between the client and the service layer. 
The controller receives the request, processes it, and 
then calls the appropriate service methods to perform business logic.


lifecycle of a request in NestJS:

step 1: request comes to the controller
get/products/110

step 2: Middleware 
 - authentication, logging, validation, etc.

step 3: guards
    - authorization and access control.

step 4: pipes
 - transform and validate incoming data.

 example:
 - 
    @Get('products/:id')
    getProductById(@Param('id', ParseIntPipe) id: number) {
        // id is now a number, and if it cannot be parsed, an error will be thrown.
    }



step 5: controller
    - handle the request and call the service layer.

step 6: service layer
    - contains the business logic and interacts with the database or other external services.

step 7: response
    - the controller sends the response back to the client.


    UseGuards( AuthGuard) - > it will check if the user is authenticated before allowing access to the route.

    UsePipes(ValidationPipe) -> it will validate the incoming data against the defined DTO (Data Transfer Object) 
                                 and throw an error if the validation fails.

    UseInterceptors(LoggingInterceptor) -> it will log the details of the request and response for debugging purposes.
    
    4/1/2026 ---------------------------------------------------------

    .
