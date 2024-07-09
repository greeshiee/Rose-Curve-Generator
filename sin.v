module sin(A, B);
  //inputs, outputs, and temps
  input  [63:0] A;
  output [63:0] B;


  real x; //holds A
  real y; //holds current power of A
  real diff; //holds current term of series
  reg [63:0] fact; //holds current factorial
  real out; //holds float output
  reg signed [63:0] B;
  reg [1:0] sign; //flag to toggle sign
  reg [7:0] i; //loop counter
  reg [1:0] flag; //flag to calculate values of sin > pi


  always @(*) begin

          x = A;
          y = x;
          fact = 1;
          sign = 0;
          i = 1;
          out = 0;
          flag = 0;

          while(x > 3140) begin
              x = x - 3141;

              if(flag == 0)
                  flag = 1;
              else
                  flag = 0;
          end

          x = x/1000;
          y = x;


          for(i = 1; i <= 11; i = i + 2) begin
              diff = y/fact;

              if(sign == 0)
                  out = out + diff;
              else
                  out = out - diff;

              y = y * x * x;
              fact = fact * (i+1) * (i+2);

              if(sign == 0)
                  sign = 1;
              else
                  sign = 0;
          end

          if(flag == 1)
              out = out*-1;
          B = out * 1000;
      end

endmodule



//-------------------------------------------------
//

