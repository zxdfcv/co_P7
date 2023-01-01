/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002903844489_4195689644_init();
    work_m_00000000000826703038_3915667111_init();
    work_m_00000000002698775005_2510865608_init();
    work_m_00000000001290389714_2748599814_init();
    work_m_00000000001719925605_3756563685_init();
    work_m_00000000001956896609_3368684588_init();
    work_m_00000000001532803756_0510645833_init();
    work_m_00000000000646853861_2795948001_init();
    work_m_00000000000340573918_4140825114_init();
    work_m_00000000004156649186_0992325708_init();
    work_m_00000000002155191593_3527808377_init();
    work_m_00000000001702548127_3935768532_init();
    work_m_00000000003988120988_3383896982_init();
    work_m_00000000000874832579_0833183191_init();
    work_m_00000000001081979205_0805627395_init();
    work_m_00000000003784510532_4127636709_init();
    work_m_00000000002559337376_3092946469_init();
    work_m_00000000001865495833_0981899902_init();
    work_m_00000000001354677521_3053705286_init();
    work_m_00000000001956880423_2319802268_init();
    work_m_00000000002451667142_1739518194_init();
    work_m_00000000000125655479_4190013900_init();
    work_m_00000000001592792273_3761551235_init();
    work_m_00000000002810596701_0001905836_init();
    work_m_00000000003064100510_2768627095_init();
    work_m_00000000003434398282_2725559894_init();
    work_m_00000000003658331372_1618395014_init();
    work_m_00000000001529073964_3975733304_init();
    work_m_00000000000823846103_0972529920_init();
    work_m_00000000003314877152_1979470459_init();
    work_m_00000000000876239012_3771887874_init();
    work_m_00000000003817477916_3027548060_init();
    work_m_00000000000056312757_0053799672_init();
    work_m_00000000001753656034_0156190743_init();
    work_m_00000000000659330988_3877310806_init();
    work_m_00000000003646637803_1131260308_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003646637803_1131260308");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
