
.env 
configModule
TypeOrmModule

npm install yml 


.env dont we do additional to does
yml is a package that allows us to parse YAML files in JavaScript. 
It can be used to read configuration files, data files, or any other 
files that are in YAML format.


.env is a file that is used to store environment variables for a 
project.

configModule is a module in NestJS that provides a way to manage configuration
variables in a NestJS application. It allows you to define configuration variables
in a central location and access them throughout your application. This can be

isGlobal:true

TypeOrmModule is a module in NestJS that provides integration with the TypeORM library.
TypeORM is an Object-Relational Mapping (ORM) library that allows you to interact
with databases using TypeScript or JavaScript. The TypeOrmModule in NestJS provides
a way to configure and use TypeORM in a NestJS application, making it easier to
connect to databases, define entities, and perform database operations.

forRootAsync is a method provided by the TypeOrmModule in NestJS that allows you to
configure the TypeORM connection asynchronously. This is useful when you need to
fetch configuration values from an external source, such as a configuration service
or environment variables, before establishing the database connection. The forRootAsync
method takes a factory function that returns a Promise, which resolves to the TypeORM
configuration object. This allows you to perform any necessary asynchronous operations
to retrieve the configuration values before initializing the TypeORM connection.

TypeOrmModule - > forRootAsync - > useFactory - > inject

- TypeOrm - largest community 
- typescript entities translate to SQL queries
- supports multiple databases
- supports both Active Record and Data Mapper patterns
- easy to use and integrate with NestJS
- provides a powerful and flexible way to manage database interactions in a NestJS application.
- TypeORM is a popular choice for database management in NestJS applications due to its ease of use, flexibility, and strong community support.
-  

forFeature is a method provided by the TypeOrmModule in NestJS 
that allows you to define which entities should be 
registered in the current module. 
This is useful when you want to organize your application into multiple modules and only want to register specific entities in each module. 
The forFeature method takes an array of entity classes as an argument and registers them with the TypeORM connection for that module. 
This allows you to use the registered entities in your services and controllers within that module, 
while keeping the database interactions organized and modularized.

entity classes are used to define the structure of the database tables and the relationships between them. 
They are decorated with TypeORM decorators to specify the table name, columns, and relationships.
The forFeature method is typically used in the module where you want to use the entities,
while the forRootAsync method is used in the root module to configure the database connection and register all entities globally.

..........................................................................................................
What’s the difference between Interceptor vs Middleware vs Filter
Interceptors
Interceptors have access to response/request before and after the route handler is called.

Middleware
Middleware is called only before the route handler is called

Exception Filters
Exception Filters are called after the route handler and after the interceptors

exception filters when to use them and how to build them

scopefilted

what happens when error is throw

- exception filters are used to catch and handle specific types of errors in a controlled manner. 
They allow developers to define custom logic for handling exceptions based on certain conditions, 
such as the type of error or the context in which it occurred.


dedicatted

@catch(HttpException)
function handleHttpException(error) {
  // Custom logic to handle HttpException
  console.error('An HTTP error occurred:', error.message);
  // You can also return a custom response or perform other actions here
}

websockets: 
................................
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
