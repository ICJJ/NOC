module debug_sv;

typedef enum{HOST,DEVICE} trans_source_e;

class Packet;

    rand bit     [3:0]        src_id;
    rand bit     [3:0]        dst_id;
    rand bit     [15:0]       data_length;
    rand bit     [7:0]        data_type;
    rand bit     [31:0]        data[];

    rand int                  idle_cycles;
    trans_source_e            trans_source;

    constraint c_data_length {
        data_length inside {1,[2:11],65536};
        data.size == data_length;
    }

    constraint c_src_dst_id{
    if(trans_source==HOST){
        src_id == 1;
        dst_id inside {[0:4]};
    }
    else{
        src_id inside {[0:4]};
        dst_id == 1;
    }
    }

    constraint c_idle{
    soft idle_cycles == 1;   
    };
endclass //className

Packet p;

initial begin
    p=new();
    p.randomize();
    foreach(p.data[i])
        $display("p.data[%d]=%h",i,p.data[i]);
    $display("p.src_id[%d]=%h",i,p.data[i]);       
    p.randomize();
    foreach(p.data[i])
        $display("p.data[%d]=%h",i,p.data[i]);
end
    
endmodule