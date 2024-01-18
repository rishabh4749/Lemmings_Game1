`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2024 18:30:54
// Design Name: 
// Module Name: des
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module des(
    input clk,
    input areset,   
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right);
    
    parameter LEFT=0,RIGHT=1;
    reg [1:0] state,next_state;
    
    always @ (*) begin
    case(state)
    
    LEFT:begin
    if(!bump_left)
    next_state<=LEFT;
    else
    next_state<=RIGHT;
    end
    
    RIGHT:begin
    if(!bump_right)
    next_state<=RIGHT;
    else
    next_state<=LEFT;
    end
    
    default:begin
    next_state<=LEFT;
    end
    endcase
    
    end
    
    always @ (posedge clk or posedge areset) begin
    if(areset)
    state<=LEFT;
    else
    state<=next_state;
    end
    
    assign walk_left=(state==LEFT)?1:0;
    assign walk_right=(state==RIGHT)?1:0;
endmodule
