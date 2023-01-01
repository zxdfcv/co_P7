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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/10791/co_P7/P7_code/Comparator.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {4U, 0U};
static unsigned int ng3[] = {5U, 0U};



static void Cont_31_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t36[8];
    char t55[8];
    char t56[8];
    char t59[8];
    char t92[8];
    char t93[8];
    char t95[8];
    char t130[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t57;
    char *t58;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    char *t86;
    char *t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t94;
    char *t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    char *t110;
    char *t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    char *t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    char *t128;
    char *t129;
    char *t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    char *t144;
    char *t145;
    char *t146;
    char *t147;
    char *t148;
    char *t149;
    unsigned int t150;
    unsigned int t151;
    char *t152;
    unsigned int t153;
    unsigned int t154;
    char *t155;
    unsigned int t156;
    unsigned int t157;
    char *t158;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1368U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t51 = *((unsigned int *)t4);
    t52 = (~(t51));
    t53 = *((unsigned int *)t29);
    t54 = (t52 || t53);
    if (t54 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t55, 8);

LAB20:    t145 = (t0 + 3408);
    t146 = (t145 + 56U);
    t147 = *((char **)t146);
    t148 = (t147 + 56U);
    t149 = *((char **)t148);
    memset(t149, 0, 8);
    t150 = 1U;
    t151 = t150;
    t152 = (t3 + 4);
    t153 = *((unsigned int *)t3);
    t150 = (t150 & t153);
    t154 = *((unsigned int *)t152);
    t151 = (t151 & t154);
    t155 = (t149 + 4);
    t156 = *((unsigned int *)t149);
    *((unsigned int *)t149) = (t156 | t150);
    t157 = *((unsigned int *)t155);
    *((unsigned int *)t155) = (t157 | t151);
    xsi_driver_vfirst_trans(t145, 0, 0);
    t158 = (t0 + 3328);
    *((int *)t158) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = (t0 + 1048U);
    t34 = *((char **)t33);
    t33 = (t0 + 1208U);
    t35 = *((char **)t33);
    memset(t36, 0, 8);
    t33 = (t34 + 4);
    t37 = (t35 + 4);
    t38 = *((unsigned int *)t34);
    t39 = *((unsigned int *)t35);
    t40 = (t38 ^ t39);
    t41 = *((unsigned int *)t33);
    t42 = *((unsigned int *)t37);
    t43 = (t41 ^ t42);
    t44 = (t40 | t43);
    t45 = *((unsigned int *)t33);
    t46 = *((unsigned int *)t37);
    t47 = (t45 | t46);
    t48 = (~(t47));
    t49 = (t44 & t48);
    if (t49 != 0)
        goto LAB22;

LAB21:    if (t47 != 0)
        goto LAB23;

LAB24:    goto LAB13;

LAB14:    t57 = (t0 + 1368U);
    t58 = *((char **)t57);
    t57 = ((char*)((ng2)));
    memset(t59, 0, 8);
    t60 = (t58 + 4);
    t61 = (t57 + 4);
    t62 = *((unsigned int *)t58);
    t63 = *((unsigned int *)t57);
    t64 = (t62 ^ t63);
    t65 = *((unsigned int *)t60);
    t66 = *((unsigned int *)t61);
    t67 = (t65 ^ t66);
    t68 = (t64 | t67);
    t69 = *((unsigned int *)t60);
    t70 = *((unsigned int *)t61);
    t71 = (t69 | t70);
    t72 = (~(t71));
    t73 = (t68 & t72);
    if (t73 != 0)
        goto LAB28;

LAB25:    if (t71 != 0)
        goto LAB27;

LAB26:    *((unsigned int *)t59) = 1;

LAB28:    memset(t56, 0, 8);
    t75 = (t59 + 4);
    t76 = *((unsigned int *)t75);
    t77 = (~(t76));
    t78 = *((unsigned int *)t59);
    t79 = (t78 & t77);
    t80 = (t79 & 1U);
    if (t80 != 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t75) != 0)
        goto LAB31;

LAB32:    t82 = (t56 + 4);
    t83 = *((unsigned int *)t56);
    t84 = *((unsigned int *)t82);
    t85 = (t83 || t84);
    if (t85 > 0)
        goto LAB33;

LAB34:    t88 = *((unsigned int *)t56);
    t89 = (~(t88));
    t90 = *((unsigned int *)t82);
    t91 = (t89 || t90);
    if (t91 > 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t82) > 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t56) > 0)
        goto LAB39;

LAB40:    memcpy(t55, t92, 8);

LAB41:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 1, t36, 1, t55, 1);
    goto LAB20;

LAB18:    memcpy(t3, t36, 8);
    goto LAB20;

LAB22:    *((unsigned int *)t36) = 1;
    goto LAB24;

LAB23:    t50 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t50) = 1;
    goto LAB24;

LAB27:    t74 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t74) = 1;
    goto LAB28;

LAB29:    *((unsigned int *)t56) = 1;
    goto LAB32;

LAB31:    t81 = (t56 + 4);
    *((unsigned int *)t56) = 1;
    *((unsigned int *)t81) = 1;
    goto LAB32;

LAB33:    t86 = (t0 + 1848U);
    t87 = *((char **)t86);
    goto LAB34;

LAB35:    t86 = (t0 + 1368U);
    t94 = *((char **)t86);
    t86 = ((char*)((ng3)));
    memset(t95, 0, 8);
    t96 = (t94 + 4);
    t97 = (t86 + 4);
    t98 = *((unsigned int *)t94);
    t99 = *((unsigned int *)t86);
    t100 = (t98 ^ t99);
    t101 = *((unsigned int *)t96);
    t102 = *((unsigned int *)t97);
    t103 = (t101 ^ t102);
    t104 = (t100 | t103);
    t105 = *((unsigned int *)t96);
    t106 = *((unsigned int *)t97);
    t107 = (t105 | t106);
    t108 = (~(t107));
    t109 = (t104 & t108);
    if (t109 != 0)
        goto LAB45;

LAB42:    if (t107 != 0)
        goto LAB44;

LAB43:    *((unsigned int *)t95) = 1;

LAB45:    memset(t93, 0, 8);
    t111 = (t95 + 4);
    t112 = *((unsigned int *)t111);
    t113 = (~(t112));
    t114 = *((unsigned int *)t95);
    t115 = (t114 & t113);
    t116 = (t115 & 1U);
    if (t116 != 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t111) != 0)
        goto LAB48;

LAB49:    t118 = (t93 + 4);
    t119 = *((unsigned int *)t93);
    t120 = *((unsigned int *)t118);
    t121 = (t119 || t120);
    if (t121 > 0)
        goto LAB50;

LAB51:    t124 = *((unsigned int *)t93);
    t125 = (~(t124));
    t126 = *((unsigned int *)t118);
    t127 = (t125 || t126);
    if (t127 > 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t118) > 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t93) > 0)
        goto LAB56;

LAB57:    memcpy(t92, t130, 8);

LAB58:    goto LAB36;

LAB37:    xsi_vlog_unsigned_bit_combine(t55, 1, t87, 1, t92, 1);
    goto LAB41;

LAB39:    memcpy(t55, t87, 8);
    goto LAB41;

LAB44:    t110 = (t95 + 4);
    *((unsigned int *)t95) = 1;
    *((unsigned int *)t110) = 1;
    goto LAB45;

LAB46:    *((unsigned int *)t93) = 1;
    goto LAB49;

LAB48:    t117 = (t93 + 4);
    *((unsigned int *)t93) = 1;
    *((unsigned int *)t117) = 1;
    goto LAB49;

LAB50:    t122 = (t0 + 1688U);
    t123 = *((char **)t122);
    goto LAB51;

LAB52:    t122 = (t0 + 1048U);
    t128 = *((char **)t122);
    t122 = (t0 + 1208U);
    t129 = *((char **)t122);
    memset(t130, 0, 8);
    t122 = (t128 + 4);
    t131 = (t129 + 4);
    t132 = *((unsigned int *)t128);
    t133 = *((unsigned int *)t129);
    t134 = (t132 ^ t133);
    t135 = *((unsigned int *)t122);
    t136 = *((unsigned int *)t131);
    t137 = (t135 ^ t136);
    t138 = (t134 | t137);
    t139 = *((unsigned int *)t122);
    t140 = *((unsigned int *)t131);
    t141 = (t139 | t140);
    t142 = (~(t141));
    t143 = (t138 & t142);
    if (t143 != 0)
        goto LAB62;

LAB59:    if (t141 != 0)
        goto LAB61;

LAB60:    *((unsigned int *)t130) = 1;

LAB62:    goto LAB53;

LAB54:    xsi_vlog_unsigned_bit_combine(t92, 1, t123, 1, t130, 1);
    goto LAB58;

LAB56:    memcpy(t92, t123, 8);
    goto LAB58;

LAB61:    t144 = (t130 + 4);
    *((unsigned int *)t130) = 1;
    *((unsigned int *)t144) = 1;
    goto LAB62;

}


extern void work_m_00000000001956880423_2319802268_init()
{
	static char *pe[] = {(void *)Cont_31_0};
	xsi_register_didat("work_m_00000000001956880423_2319802268", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000001956880423_2319802268.didat");
	xsi_register_executes(pe);
}
