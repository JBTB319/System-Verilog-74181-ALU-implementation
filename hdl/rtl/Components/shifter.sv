module shifter (
   input logic [3:0] a,
   output logic [3:0] a_s
);
   assign a_s[3] = a[2];
   assign a_s[2] = a[1];
   assign a_s[1] = a[0];
   assign a_s[0] = 0;
endmodule