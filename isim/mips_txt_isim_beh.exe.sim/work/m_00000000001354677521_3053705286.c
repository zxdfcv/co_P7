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
static int ng1[] = {0, 0};
static int ng2[] = {31, 0};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {0U, 0U};
static int ng5[] = {1, 0};



static void Always_65_0(char *t0)
{
    char t6[8];
    char t7[8];
    char t8[8];
    char t17[8];
    char t24[8];
    char t40[8];
    char t54[8];
    char t61[8];
    char t77[8];
    char t85[8];
    char t127[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t62;
    char *t63;
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
    unsigned int t74;
    unsigned int t75;
    char *t76;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    char *t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    int t109;
    int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    char *t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;
    char *t124;
    char *t125;
    char *t126;
    char *t128;
    char *t129;
    unsigned int t130;
    unsigned int t131;
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
    char *t142;
    char *t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    char *t149;
    char *t150;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3168);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(65, ng0);

LAB5:    xsi_set_current_line(66, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1608);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(68, ng0);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB6:    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t8, 0, 8);
    xsi_vlog_signed_greatereq(t8, 32, t4, 32, t5, 32);
    t9 = (t8 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB7;

LAB8:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t8, 0, 8);
    t9 = (t4 + 4);
    t15 = (t5 + 4);
    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t5);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t9);
    t14 = *((unsigned int *)t15);
    t27 = (t13 ^ t14);
    t28 = (t12 | t27);
    t29 = *((unsigned int *)t9);
    t30 = *((unsigned int *)t15);
    t31 = (t29 | t30);
    t32 = (~(t31));
    t33 = (t28 & t32);
    if (t33 != 0)
        goto LAB84;

LAB81:    if (t31 != 0)
        goto LAB83;

LAB82:    *((unsigned int *)t8) = 1;

LAB84:    memset(t7, 0, 8);
    t18 = (t8 + 4);
    t34 = *((unsigned int *)t18);
    t35 = (~(t34));
    t36 = *((unsigned int *)t8);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB85;

LAB86:    if (*((unsigned int *)t18) != 0)
        goto LAB87;

LAB88:    t20 = (t7 + 4);
    t42 = *((unsigned int *)t7);
    t43 = *((unsigned int *)t20);
    t44 = (t42 || t43);
    if (t44 > 0)
        goto LAB89;

LAB90:    t45 = *((unsigned int *)t7);
    t46 = (~(t45));
    t49 = *((unsigned int *)t20);
    t50 = (t46 || t49);
    if (t50 > 0)
        goto LAB91;

LAB92:    if (*((unsigned int *)t20) > 0)
        goto LAB93;

LAB94:    if (*((unsigned int *)t7) > 0)
        goto LAB95;

LAB96:    memcpy(t6, t25, 8);

LAB97:    t26 = (t0 + 1608);
    xsi_vlogvar_assign_value(t26, t6, 0, 0, 1);
    goto LAB2;

LAB7:    xsi_set_current_line(68, ng0);

LAB9:    xsi_set_current_line(69, ng0);
    t15 = (t0 + 1048U);
    t16 = *((char **)t15);
    t15 = (t0 + 1008U);
    t18 = (t15 + 72U);
    t19 = *((char **)t18);
    t20 = (t0 + 1768);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    xsi_vlog_generic_get_index_select_value(t17, 1, t16, t19, 2, t22, 32, 1);
    t23 = ((char*)((ng3)));
    memset(t24, 0, 8);
    t25 = (t17 + 4);
    t26 = (t23 + 4);
    t27 = *((unsigned int *)t17);
    t28 = *((unsigned int *)t23);
    t29 = (t27 ^ t28);
    t30 = *((unsigned int *)t25);
    t31 = *((unsigned int *)t26);
    t32 = (t30 ^ t31);
    t33 = (t29 | t32);
    t34 = *((unsigned int *)t25);
    t35 = *((unsigned int *)t26);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB13;

LAB10:    if (t36 != 0)
        goto LAB12;

LAB11:    *((unsigned int *)t24) = 1;

LAB13:    memset(t40, 0, 8);
    t41 = (t24 + 4);
    t42 = *((unsigned int *)t41);
    t43 = (~(t42));
    t44 = *((unsigned int *)t24);
    t45 = (t44 & t43);
    t46 = (t45 & 1U);
    if (t46 != 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t41) != 0)
        goto LAB16;

LAB17:    t48 = (t40 + 4);
    t49 = *((unsigned int *)t40);
    t50 = *((unsigned int *)t48);
    t51 = (t49 || t50);
    if (t51 > 0)
        goto LAB18;

LAB19:    memcpy(t85, t40, 8);

LAB20:    t117 = (t85 + 4);
    t118 = *((unsigned int *)t117);
    t119 = (~(t118));
    t120 = *((unsigned int *)t85);
    t121 = (t120 & t119);
    t122 = (t121 != 0);
    if (t122 > 0)
        goto LAB32;

LAB33:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1008U);
    t4 = (t2 + 72U);
    t5 = *((char **)t4);
    t9 = (t0 + 1768);
    t15 = (t9 + 56U);
    t16 = *((char **)t15);
    xsi_vlog_generic_get_index_select_value(t6, 1, t3, t5, 2, t16, 32, 1);
    t18 = ((char*)((ng4)));
    memset(t7, 0, 8);
    t19 = (t6 + 4);
    t20 = (t18 + 4);
    t10 = *((unsigned int *)t6);
    t11 = *((unsigned int *)t18);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t19);
    t14 = *((unsigned int *)t20);
    t27 = (t13 ^ t14);
    t28 = (t12 | t27);
    t29 = *((unsigned int *)t19);
    t30 = *((unsigned int *)t20);
    t31 = (t29 | t30);
    t32 = (~(t31));
    t33 = (t28 & t32);
    if (t33 != 0)
        goto LAB48;

LAB45:    if (t31 != 0)
        goto LAB47;

LAB46:    *((unsigned int *)t7) = 1;

LAB48:    memset(t8, 0, 8);
    t22 = (t7 + 4);
    t34 = *((unsigned int *)t22);
    t35 = (~(t34));
    t36 = *((unsigned int *)t7);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t22) != 0)
        goto LAB51;

LAB52:    t25 = (t8 + 4);
    t42 = *((unsigned int *)t8);
    t43 = *((unsigned int *)t25);
    t44 = (t42 || t43);
    if (t44 > 0)
        goto LAB53;

LAB54:    memcpy(t54, t8, 8);

LAB55:    t89 = (t54 + 4);
    t112 = *((unsigned int *)t89);
    t113 = (~(t112));
    t114 = *((unsigned int *)t54);
    t115 = (t114 & t113);
    t116 = (t115 != 0);
    if (t116 > 0)
        goto LAB67;

LAB68:    xsi_set_current_line(77, ng0);

LAB71:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t9 = (t4 + 4);
    t15 = (t5 + 4);
    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t5);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t9);
    t14 = *((unsigned int *)t15);
    t27 = (t13 ^ t14);
    t28 = (t12 | t27);
    t29 = *((unsigned int *)t9);
    t30 = *((unsigned int *)t15);
    t31 = (t29 | t30);
    t32 = (~(t31));
    t33 = (t28 & t32);
    if (t33 != 0)
        goto LAB75;

LAB72:    if (t31 != 0)
        goto LAB74;

LAB73:    *((unsigned int *)t6) = 1;

LAB75:    t18 = (t6 + 4);
    t34 = *((unsigned int *)t18);
    t35 = (~(t34));
    t36 = *((unsigned int *)t6);
    t37 = (t36 & t35);
    t38 = (t37 != 0);
    if (t38 > 0)
        goto LAB76;

LAB77:    xsi_set_current_line(80, ng0);

LAB80:    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB78:
LAB69:
LAB34:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t6, 0, 8);
    xsi_vlog_signed_minus(t6, 32, t4, 32, t5, 32);
    t9 = (t0 + 1768);
    xsi_vlogvar_assign_value(t9, t6, 0, 0, 32);
    goto LAB6;

LAB12:    t39 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB13;

LAB14:    *((unsigned int *)t40) = 1;
    goto LAB17;

LAB16:    t47 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB17;

LAB18:    t52 = (t0 + 1208U);
    t53 = *((char **)t52);
    t52 = (t0 + 1168U);
    t55 = (t52 + 72U);
    t56 = *((char **)t55);
    t57 = (t0 + 1768);
    t58 = (t57 + 56U);
    t59 = *((char **)t58);
    xsi_vlog_generic_get_index_select_value(t54, 1, t53, t56, 2, t59, 32, 1);
    t60 = ((char*)((ng3)));
    memset(t61, 0, 8);
    t62 = (t54 + 4);
    t63 = (t60 + 4);
    t64 = *((unsigned int *)t54);
    t65 = *((unsigned int *)t60);
    t66 = (t64 ^ t65);
    t67 = *((unsigned int *)t62);
    t68 = *((unsigned int *)t63);
    t69 = (t67 ^ t68);
    t70 = (t66 | t69);
    t71 = *((unsigned int *)t62);
    t72 = *((unsigned int *)t63);
    t73 = (t71 | t72);
    t74 = (~(t73));
    t75 = (t70 & t74);
    if (t75 != 0)
        goto LAB24;

LAB21:    if (t73 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t61) = 1;

LAB24:    memset(t77, 0, 8);
    t78 = (t61 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (~(t79));
    t81 = *((unsigned int *)t61);
    t82 = (t81 & t80);
    t83 = (t82 & 1U);
    if (t83 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t78) != 0)
        goto LAB27;

LAB28:    t86 = *((unsigned int *)t40);
    t87 = *((unsigned int *)t77);
    t88 = (t86 & t87);
    *((unsigned int *)t85) = t88;
    t89 = (t40 + 4);
    t90 = (t77 + 4);
    t91 = (t85 + 4);
    t92 = *((unsigned int *)t89);
    t93 = *((unsigned int *)t90);
    t94 = (t92 | t93);
    *((unsigned int *)t91) = t94;
    t95 = *((unsigned int *)t91);
    t96 = (t95 != 0);
    if (t96 == 1)
        goto LAB29;

LAB30:
LAB31:    goto LAB20;

LAB23:    t76 = (t61 + 4);
    *((unsigned int *)t61) = 1;
    *((unsigned int *)t76) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t77) = 1;
    goto LAB28;

LAB27:    t84 = (t77 + 4);
    *((unsigned int *)t77) = 1;
    *((unsigned int *)t84) = 1;
    goto LAB28;

LAB29:    t97 = *((unsigned int *)t85);
    t98 = *((unsigned int *)t91);
    *((unsigned int *)t85) = (t97 | t98);
    t99 = (t40 + 4);
    t100 = (t77 + 4);
    t101 = *((unsigned int *)t40);
    t102 = (~(t101));
    t103 = *((unsigned int *)t99);
    t104 = (~(t103));
    t105 = *((unsigned int *)t77);
    t106 = (~(t105));
    t107 = *((unsigned int *)t100);
    t108 = (~(t107));
    t109 = (t102 & t104);
    t110 = (t106 & t108);
    t111 = (~(t109));
    t112 = (~(t110));
    t113 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t113 & t111);
    t114 = *((unsigned int *)t91);
    *((unsigned int *)t91) = (t114 & t112);
    t115 = *((unsigned int *)t85);
    *((unsigned int *)t85) = (t115 & t111);
    t116 = *((unsigned int *)t85);
    *((unsigned int *)t85) = (t116 & t112);
    goto LAB31;

LAB32:    xsi_set_current_line(69, ng0);

LAB35:    xsi_set_current_line(70, ng0);
    t123 = (t0 + 1928);
    t124 = (t123 + 56U);
    t125 = *((char **)t124);
    t126 = ((char*)((ng4)));
    memset(t127, 0, 8);
    t128 = (t125 + 4);
    t129 = (t126 + 4);
    t130 = *((unsigned int *)t125);
    t131 = *((unsigned int *)t126);
    t132 = (t130 ^ t131);
    t133 = *((unsigned int *)t128);
    t134 = *((unsigned int *)t129);
    t135 = (t133 ^ t134);
    t136 = (t132 | t135);
    t137 = *((unsigned int *)t128);
    t138 = *((unsigned int *)t129);
    t139 = (t137 | t138);
    t140 = (~(t139));
    t141 = (t136 & t140);
    if (t141 != 0)
        goto LAB39;

LAB36:    if (t139 != 0)
        goto LAB38;

LAB37:    *((unsigned int *)t127) = 1;

LAB39:    t143 = (t127 + 4);
    t144 = *((unsigned int *)t143);
    t145 = (~(t144));
    t146 = *((unsigned int *)t127);
    t147 = (t146 & t145);
    t148 = (t147 != 0);
    if (t148 > 0)
        goto LAB40;

LAB41:    xsi_set_current_line(72, ng0);

LAB44:    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB42:    goto LAB34;

LAB38:    t142 = (t127 + 4);
    *((unsigned int *)t127) = 1;
    *((unsigned int *)t142) = 1;
    goto LAB39;

LAB40:    xsi_set_current_line(70, ng0);

LAB43:    xsi_set_current_line(71, ng0);
    t149 = ((char*)((ng3)));
    t150 = (t0 + 1608);
    xsi_vlogvar_assign_value(t150, t149, 0, 0, 1);
    goto LAB42;

LAB47:    t21 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB48;

LAB49:    *((unsigned int *)t8) = 1;
    goto LAB52;

LAB51:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB52;

LAB53:    t26 = (t0 + 1208U);
    t39 = *((char **)t26);
    t26 = (t0 + 1168U);
    t41 = (t26 + 72U);
    t47 = *((char **)t41);
    t48 = (t0 + 1768);
    t52 = (t48 + 56U);
    t53 = *((char **)t52);
    xsi_vlog_generic_get_index_select_value(t17, 1, t39, t47, 2, t53, 32, 1);
    t55 = ((char*)((ng4)));
    memset(t24, 0, 8);
    t56 = (t17 + 4);
    t57 = (t55 + 4);
    t45 = *((unsigned int *)t17);
    t46 = *((unsigned int *)t55);
    t49 = (t45 ^ t46);
    t50 = *((unsigned int *)t56);
    t51 = *((unsigned int *)t57);
    t64 = (t50 ^ t51);
    t65 = (t49 | t64);
    t66 = *((unsigned int *)t56);
    t67 = *((unsigned int *)t57);
    t68 = (t66 | t67);
    t69 = (~(t68));
    t70 = (t65 & t69);
    if (t70 != 0)
        goto LAB59;

LAB56:    if (t68 != 0)
        goto LAB58;

LAB57:    *((unsigned int *)t24) = 1;

LAB59:    memset(t40, 0, 8);
    t59 = (t24 + 4);
    t71 = *((unsigned int *)t59);
    t72 = (~(t71));
    t73 = *((unsigned int *)t24);
    t74 = (t73 & t72);
    t75 = (t74 & 1U);
    if (t75 != 0)
        goto LAB60;

LAB61:    if (*((unsigned int *)t59) != 0)
        goto LAB62;

LAB63:    t79 = *((unsigned int *)t8);
    t80 = *((unsigned int *)t40);
    t81 = (t79 & t80);
    *((unsigned int *)t54) = t81;
    t62 = (t8 + 4);
    t63 = (t40 + 4);
    t76 = (t54 + 4);
    t82 = *((unsigned int *)t62);
    t83 = *((unsigned int *)t63);
    t86 = (t82 | t83);
    *((unsigned int *)t76) = t86;
    t87 = *((unsigned int *)t76);
    t88 = (t87 != 0);
    if (t88 == 1)
        goto LAB64;

LAB65:
LAB66:    goto LAB55;

LAB58:    t58 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t58) = 1;
    goto LAB59;

LAB60:    *((unsigned int *)t40) = 1;
    goto LAB63;

LAB62:    t60 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t60) = 1;
    goto LAB63;

LAB64:    t92 = *((unsigned int *)t54);
    t93 = *((unsigned int *)t76);
    *((unsigned int *)t54) = (t92 | t93);
    t78 = (t8 + 4);
    t84 = (t40 + 4);
    t94 = *((unsigned int *)t8);
    t95 = (~(t94));
    t96 = *((unsigned int *)t78);
    t97 = (~(t96));
    t98 = *((unsigned int *)t40);
    t101 = (~(t98));
    t102 = *((unsigned int *)t84);
    t103 = (~(t102));
    t109 = (t95 & t97);
    t110 = (t101 & t103);
    t104 = (~(t109));
    t105 = (~(t110));
    t106 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t106 & t104);
    t107 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t107 & t105);
    t108 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t108 & t104);
    t111 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t111 & t105);
    goto LAB66;

LAB67:    xsi_set_current_line(75, ng0);

LAB70:    goto LAB69;

LAB74:    t16 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB75;

LAB76:    xsi_set_current_line(78, ng0);

LAB79:    xsi_set_current_line(79, ng0);
    t19 = ((char*)((ng3)));
    t20 = (t0 + 1928);
    xsi_vlogvar_assign_value(t20, t19, 0, 0, 1);
    goto LAB78;

LAB83:    t16 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB84;

LAB85:    *((unsigned int *)t7) = 1;
    goto LAB88;

LAB87:    t19 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB88;

LAB89:    t21 = (t0 + 1608);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    goto LAB90;

LAB91:    t25 = ((char*)((ng4)));
    goto LAB92;

LAB93:    xsi_vlog_unsigned_bit_combine(t6, 1, t23, 1, t25, 1);
    goto LAB97;

LAB95:    memcpy(t6, t23, 8);
    goto LAB97;

}


extern void work_m_00000000001354677521_3053705286_init()
{
	static char *pe[] = {(void *)Always_65_0};
	xsi_register_didat("work_m_00000000001354677521_3053705286", "isim/mips_txt_isim_beh.exe.sim/work/m_00000000001354677521_3053705286.didat");
	xsi_register_executes(pe);
}
