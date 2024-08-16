`ifndef NOC_TRANSACTION_SV
`define NOC_TRANSACTION_SV

typedef enum{HOST,DEVICE} trans_source_e;

class noc_transaction extends uvm_sequence_item;
    localparam scemi_v1 = 'hA8;
    localparam scemi_v2 = 'hAC;

    rand bit     [3:0]        src_id;
    rand bit     [3:0]        dst_id;
    rand bit     [15:0]       data_length;//size of 4Bytes
    rand bit     [7:0]        data_type;
    rand bit     [31:0]       data[];

    rand int                  idle_cycles;
    rand trans_source_e       trans_source;

   constraint c_data_length {
      soft  data_length dist {4:=10,[4*2:4*30]:/80,4*16383:=10};
      soft  data_length%4 == 0;
   }

   constraint c_data_size{
    soft  data.size == data_length/4;
   }

   constraint c_src_dst_id{
    if(trans_source==HOST){
      soft  src_id == 1;
      soft  dst_id inside {[1:4]};
    }
    else{
      soft  src_id inside {[1:4]};
      soft  dst_id == 1;
    }
   }

  constraint c_data_type{
    soft data_type dist {scemi_v1:=50,scemi_v2:=50};
   }

  constraint c_packet_idle{
    soft idle_cycles dist {[1:10]:/50,data_length%4:/50}; //only burst idle_cycles=0  
  }


  `uvm_object_utils_begin(noc_transaction)
    `uvm_field_int(src_id                   , UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(dst_id                   , UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(data_length              , UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(data_type                , UVM_ALL_ON | UVM_DEC)  
    `uvm_field_array_int(data               , UVM_ALL_ON)  
    `uvm_field_int(idle_cycles              , UVM_ALL_ON | UVM_DEC | UVM_NOCOMPARE)  
    `uvm_field_enum(trans_source_e,trans_source            , UVM_ALL_ON | UVM_NOCOMPARE) 
  `uvm_object_utils_end


  function new(string name = "noc_transaction");
  super.new(name);
  endfunction

endclass




`endif // NOC_TRANSACTION_SV
