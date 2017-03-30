/*
 *    ======== tcpEcho.c ========
 *    Contains BSD sockets code.
 */

#include <string.h>

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/System.h>

#include</home/kalpesh/ti/tirex-content/TivaWare_C_Series-2.1.3.156/>


#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/drivers/GPIO.h>

/* NDK BSD support */
#include <sys/socket.h>

/* Example/Board Header file */
#include "Board.h"

#define ACC 1000
#define ARR 1000

#define TCPPACKETSIZE 1
#define NUMTCPWORKERS 1

/*
 *  ======== tcpWorker ========
 *  Task to handle TCP connection. Can be multiple Tasks running
 *  this function.
 */



/*
 *  ======== tcpHandler ========
 *  Creates new Task to handle new TCP connections.
 */
Void tcpHandler(UArg arg0, UArg arg1)
{
    int                status;
    int                clientfd;
    int                server;
    struct sockaddr_in localAddr;
    struct sockaddr_in clientAddr;
    int                optval,sndsize,tj;
    int                optlen = sizeof(optval);
    int in_num;
    socklen_t          addrlen = sizeof(clientAddr);
    Task_Handle        taskHandle;
    Task_Params        taskParams;
    Error_Block        eb;
    short 				*data;
     int  bytesRcvd=0,mul=0,di=0;
     unsigned char      rcvbuf[1],buff[100];
     unsigned char buffer[]="Enter Sampling Rate :" ;
     UInt32 counter,i;
     volatile uint32_t ui32Loop;

     data = (short *)malloc (sizeof(short)* 10000);

     if (!data)
     {
    	 System_printf ("Not enough memory.");
    	 System_flush();
    	 return;
     }

    server = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if (server == -1) {
        System_printf("Error: socket not created.\n");
        goto shutdown;
    }


    memset(&localAddr, 0, sizeof(localAddr));
    localAddr.sin_family = AF_INET;
    localAddr.sin_addr.s_addr = inet_addr("192.168.1.5");
    localAddr.sin_port = htons(10000);
  //  temp = htons(arg0);
   // localAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    //localAddr.sin_port = htons(arg0);

    status = bind(server, (struct sockaddr *)&localAddr, sizeof(localAddr));
    if (status == -1) {
        System_printf("Error: bind failed.\n");
        goto shutdown;
    }

    status = listen(server, NUMTCPWORKERS);
    if (status == -1) {
        System_printf("Error: listen failed.\n");
        goto shutdown;
    }

    optval = 1;
    if (setsockopt(server, SOL_SOCKET, SO_KEEPALIVE, &optval, optlen) < 0) {
        System_printf("Error: setsockopt failed\n");
        goto shutdown;
    }

    //err = setsockopt(skt, SOL_SOCKET, SO_RCVBUF,(char *)&sndsize, (int)sizeof(sndsize));

 /*   if (setsockopt(server, SOL_SOCKET, SO_RCVBUF,(char *)&sndsize, (int)sizeof(sndsize)) < 0) {
           System_printf("Error: setsockopt failed\n");
           goto shutdown;
       }  */
	 System_printf("Trying to ACCEPTED  clientfd \n");
		System_flush();
    clientfd = accept(server, (struct sockaddr *)&clientAddr, &addrlen) ;

    System_printf(" ACCEPTED first  clientfd \n");
   		System_flush();


   		send(clientfd, "Enter the Sampling Rate", 23, 0);
   		while (1)
   		{
   		SysCtlDelay(200);
   		bytesRcvd = recv(clientfd, buff, 50, 0)  ;

   		for (i = 0; i < bytesRcvd; ++i)
   		{
   			if (buff[i] < 48 || buff[i] > 57)
   				break;
   		}

   		if (i == bytesRcvd || buff[i] == '\n')
   		{
   			break;
   		}

   		send (clientfd, "Try again.", 10, 0);
   		}
//	SysCtlDelay(200);
	buff[bytesRcvd] = '\0';
	in_num = atoi(buff);

	 System_printf("ACCEPTED  First connection \n");
			System_flush();

	System_printf("In number:%d", in_num);
	System_flush();

	//System_printf(buff);
	//System_flush();
			close(clientfd);
/////////////////////////       Second SOcket      //////////////////////////////////////

	 clientfd = accept(server, (struct sockaddr *)&clientAddr, &addrlen) ;
	 System_printf(" ACCEPTED second  clientfd \n");
	    		System_flush();

        /* Init the Error_Block */
       // Error_init(&eb)
	    		for (i = 0; i < 10000; ++i)
	    		{
	    			bytesRcvd = recv(clientfd, &data[i], sizeof(short), 0);

	    			if (bytesRcvd < 2)
	    				break;
	    		}

	    		System_printf ("The number of values: %d\n", i);
	    		System_flush();

	   /* 		for (i = 0; i < 1000; ++i)
	    		{
	    			System_flush();
	    			System_printf("%d\t%d\n", (data[i] >> 8)&255, data[i]&255);
	    		}
	    		System_flush();
       */
	      System_printf("Second connection Completed\n Writing on GPIO\n");
	    	System_flush();


 /*
	    	di=ARR/ACC;
        mul=0;

        for(i=0;i<di;i++)
        {
        for(counter=0;counter<ACC;counter++)
        {
        	arr[mul]=temp[counter];
        	mul++;

        }
        }

    */

        counter=0;
          System_printf("Entering while 1\n");
              System_flush();
                        while(1)
                      {
        	              if(counter==i)
        	            	  counter=0;
        	              else
        	            	  tj=0;
                          //
                          // Turn on the LED.
                          //
                      	 HWREG(GPIO_PORTM_BASE + (GPIO_O_DATA + (0x0ff << 2))) = (data[counter] >> 8) & 255;
                      	 counter++;

                      	//Task_sleep(1);
                      	SysCtlDelay(32);
                      }






        close(clientfd);
   // System_printf("Error: accept failed.\n");

shutdown:
    if (server > 0) {
        close(server);
    }
}

/*
 *  ======== main ========
 */
int main(void)
{
    /* Call board init functions */
    Board_initGeneral();
    Board_initGPIO();
    Board_initEMAC();
    volatile uint32_t ui32Loop;

    GPIOPinTypeGPIOOutput(GPIO_PORTM_BASE, 0x0ff);

    System_printf("Starting the TCP Echo example\nSystem provider is set to "
                  "SysMin. Halt the target to view any SysMin contents in"
                  " ROV.\n");
    /* SysMin will only print to the console when you call flush or exit */
    System_flush();
      //
      // Loop forever.
      //
    /* Start BIOS */
    BIOS_start();

    return (0);
}
