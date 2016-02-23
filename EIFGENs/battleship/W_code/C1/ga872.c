/*
 * Code for class GAME_COLOR
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F872_8515(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F872_8516(EIF_REFERENCE);
extern EIF_TYPED_VALUE F872_8517(EIF_REFERENCE);
extern EIF_TYPED_VALUE F872_8518(EIF_REFERENCE);
extern EIF_TYPED_VALUE F872_8519(EIF_REFERENCE);
extern void F872_8520(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F872_8521(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F872_8522(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F872_8523(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void EIF_Minit872(void);

#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {GAME_COLOR}.make */
void F872_8515 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x, EIF_TYPED_VALUE arg3x, EIF_TYPED_VALUE arg4x)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
#define arg1 arg1x.it_n1
#define arg2 arg2x.it_n1
#define arg3 arg3x.it_n1
#define arg4 arg4x.it_n1
	EIF_TYPED_VALUE uu1_1x = {{0}, SK_UINT8};
#define uu1_1 uu1_1x.it_n1
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg4x.type & SK_HEAD) == SK_REF) arg4x.it_n1 = * (EIF_NATURAL_8 *) arg4x.it_r;
	if ((arg3x.type & SK_HEAD) == SK_REF) arg3x.it_n1 = * (EIF_NATURAL_8 *) arg3x.it_r;
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_n1 = * (EIF_NATURAL_8 *) arg2x.it_r;
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_n1 = * (EIF_NATURAL_8 *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_UINT8,&arg1);
	RTLU(SK_UINT8,&arg2);
	RTLU(SK_UINT8,&arg3);
	RTLU(SK_UINT8,&arg4);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 871, Current, 0, 4, 14194);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(871, Current, 14194);
	RTIV(Current, RTAL);
	RTHOOK(1);
	uu1_1 = arg1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(6429, dtype))(Current, uu1_1x);
	RTHOOK(2);
	uu1_1 = arg2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(6430, dtype))(Current, uu1_1x);
	RTHOOK(3);
	uu1_1 = arg3;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(6431, dtype))(Current, uu1_1x);
	RTHOOK(4);
	uu1_1 = arg4;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(6432, dtype))(Current, uu1_1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(5);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(6);
	RTEE;
#undef uu1_1
#undef arg4
#undef arg3
#undef arg2
#undef arg1
}

/* {GAME_COLOR}.red */
EIF_TYPED_VALUE F872_8516 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "red";
	RTEX;
	EIF_NATURAL_8 Result = ((EIF_NATURAL_8) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_UINT8, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 871, Current, 0, 0, 14195);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(871, Current, 14195);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x30000000, 1,0); /* Result */
	Result = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6416, 870))(Current)).it_n1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_UINT8; r.it_n1 = Result; return r; }
}

/* {GAME_COLOR}.green */
EIF_TYPED_VALUE F872_8517 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "green";
	RTEX;
	EIF_NATURAL_8 Result = ((EIF_NATURAL_8) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_UINT8, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 871, Current, 0, 0, 14196);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(871, Current, 14196);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x30000000, 1,0); /* Result */
	Result = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6417, 870))(Current)).it_n1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_UINT8; r.it_n1 = Result; return r; }
}

/* {GAME_COLOR}.blue */
EIF_TYPED_VALUE F872_8518 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "blue";
	RTEX;
	EIF_NATURAL_8 Result = ((EIF_NATURAL_8) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_UINT8, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 871, Current, 0, 0, 14197);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(871, Current, 14197);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x30000000, 1,0); /* Result */
	Result = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6418, 870))(Current)).it_n1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_UINT8; r.it_n1 = Result; return r; }
}

/* {GAME_COLOR}.alpha */
EIF_TYPED_VALUE F872_8519 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "alpha";
	RTEX;
	EIF_NATURAL_8 Result = ((EIF_NATURAL_8) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_UINT8, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 871, Current, 0, 0, 14198);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(871, Current, 14198);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x30000000, 1,0); /* Result */
	Result = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6419, 870))(Current)).it_n1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_UINT8; r.it_n1 = Result; return r; }
}

/* {GAME_COLOR}.set_red */
void F872_8520 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_red";
	RTEX;
#define arg1 arg1x.it_n1
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_NATURAL_8 tu1_1;
	EIF_NATURAL_8 tu1_2;
	EIF_NATURAL_8 tu1_3;
	EIF_NATURAL_8 tu1_4;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_n1 = * (EIF_NATURAL_8 *) arg1x.it_r;
	
	RTLI(4);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,tr2);
	RTLR(3,tr3);
	RTLIU(4);
	RTLU (SK_VOID, NULL);
	RTLU(SK_UINT8,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 871, Current, 0, 1, 14199);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(871, Current, 14199);
	RTIV(Current, RTAL);
	if (RTAL & CK_ENSURE) {
		in_assertion = ~0;
		RTE_OT
		tu1_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6418, dtype))(Current)).it_n1);
		tu1_1 = tu1_2;
		tr1 = NULL;
		RTE_O
		tr1 = RTLA;
		RTE_OE
		RTE_OT
		tu1_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6417, dtype))(Current)).it_n1);
		tu1_2 = tu1_3;
		tr2 = NULL;
		RTE_O
		tr2 = RTLA;
		RTE_OE
		RTE_OT
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6419, dtype))(Current)).it_n1);
		tu1_3 = tu1_4;
		tr3 = NULL;
		RTE_O
		tr3 = RTLA;
		RTE_OE
		in_assertion = 0;
	}
	RTHOOK(1);
	RTDBGAA(Current, dtype, 6425, 0x30000000, 1); /* red_internal */
	*(EIF_NATURAL_8 *)(Current + RTWA(6425, dtype)) = (EIF_NATURAL_8) arg1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(2);
		RTCT("set_red_is_set", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6416, dtype))(Current)).it_n1);
		if ((EIF_BOOLEAN)(tu1_4 == arg1)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(3);
		RTCT("set_red_blue_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6418, dtype))(Current)).it_n1);
		RTCO(tr1);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_1)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(4);
		RTCT("set_red_green_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6417, dtype))(Current)).it_n1);
		RTCO(tr2);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_2)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(5);
		RTCT("set_red_alpha_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6419, dtype))(Current)).it_n1);
		RTCO(tr3);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_3)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {GAME_COLOR}.set_green */
void F872_8521 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_green";
	RTEX;
#define arg1 arg1x.it_n1
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_NATURAL_8 tu1_1;
	EIF_NATURAL_8 tu1_2;
	EIF_NATURAL_8 tu1_3;
	EIF_NATURAL_8 tu1_4;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_n1 = * (EIF_NATURAL_8 *) arg1x.it_r;
	
	RTLI(4);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,tr2);
	RTLR(3,tr3);
	RTLIU(4);
	RTLU (SK_VOID, NULL);
	RTLU(SK_UINT8,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 871, Current, 0, 1, 14200);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(871, Current, 14200);
	RTIV(Current, RTAL);
	if (RTAL & CK_ENSURE) {
		in_assertion = ~0;
		RTE_OT
		tu1_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6418, dtype))(Current)).it_n1);
		tu1_1 = tu1_2;
		tr1 = NULL;
		RTE_O
		tr1 = RTLA;
		RTE_OE
		RTE_OT
		tu1_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6416, dtype))(Current)).it_n1);
		tu1_2 = tu1_3;
		tr2 = NULL;
		RTE_O
		tr2 = RTLA;
		RTE_OE
		RTE_OT
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6419, dtype))(Current)).it_n1);
		tu1_3 = tu1_4;
		tr3 = NULL;
		RTE_O
		tr3 = RTLA;
		RTE_OE
		in_assertion = 0;
	}
	RTHOOK(1);
	RTDBGAA(Current, dtype, 6426, 0x30000000, 1); /* green_internal */
	*(EIF_NATURAL_8 *)(Current + RTWA(6426, dtype)) = (EIF_NATURAL_8) arg1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(2);
		RTCT("set_green_is_set", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6417, dtype))(Current)).it_n1);
		if ((EIF_BOOLEAN)(tu1_4 == arg1)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(3);
		RTCT("set_green_blue_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6418, dtype))(Current)).it_n1);
		RTCO(tr1);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_1)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(4);
		RTCT("set_green_red_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6416, dtype))(Current)).it_n1);
		RTCO(tr2);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_2)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(5);
		RTCT("set_green_alpha_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6419, dtype))(Current)).it_n1);
		RTCO(tr3);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_3)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {GAME_COLOR}.set_blue */
void F872_8522 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_blue";
	RTEX;
#define arg1 arg1x.it_n1
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_NATURAL_8 tu1_1;
	EIF_NATURAL_8 tu1_2;
	EIF_NATURAL_8 tu1_3;
	EIF_NATURAL_8 tu1_4;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_n1 = * (EIF_NATURAL_8 *) arg1x.it_r;
	
	RTLI(4);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,tr2);
	RTLR(3,tr3);
	RTLIU(4);
	RTLU (SK_VOID, NULL);
	RTLU(SK_UINT8,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 871, Current, 0, 1, 14201);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(871, Current, 14201);
	RTIV(Current, RTAL);
	if (RTAL & CK_ENSURE) {
		in_assertion = ~0;
		RTE_OT
		tu1_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6416, dtype))(Current)).it_n1);
		tu1_1 = tu1_2;
		tr1 = NULL;
		RTE_O
		tr1 = RTLA;
		RTE_OE
		RTE_OT
		tu1_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6417, dtype))(Current)).it_n1);
		tu1_2 = tu1_3;
		tr2 = NULL;
		RTE_O
		tr2 = RTLA;
		RTE_OE
		RTE_OT
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6419, dtype))(Current)).it_n1);
		tu1_3 = tu1_4;
		tr3 = NULL;
		RTE_O
		tr3 = RTLA;
		RTE_OE
		in_assertion = 0;
	}
	RTHOOK(1);
	RTDBGAA(Current, dtype, 6427, 0x30000000, 1); /* blue_internal */
	*(EIF_NATURAL_8 *)(Current + RTWA(6427, dtype)) = (EIF_NATURAL_8) arg1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(2);
		RTCT("set_blue_is_set", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6418, dtype))(Current)).it_n1);
		if ((EIF_BOOLEAN)(tu1_4 == arg1)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(3);
		RTCT("set_blue_red_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6416, dtype))(Current)).it_n1);
		RTCO(tr1);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_1)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(4);
		RTCT("set_blue_green_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6417, dtype))(Current)).it_n1);
		RTCO(tr2);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_2)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(5);
		RTCT("set_blue_alpha_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6419, dtype))(Current)).it_n1);
		RTCO(tr3);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_3)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {GAME_COLOR}.set_alpha */
void F872_8523 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_alpha";
	RTEX;
#define arg1 arg1x.it_n1
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_NATURAL_8 tu1_1;
	EIF_NATURAL_8 tu1_2;
	EIF_NATURAL_8 tu1_3;
	EIF_NATURAL_8 tu1_4;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_n1 = * (EIF_NATURAL_8 *) arg1x.it_r;
	
	RTLI(4);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,tr2);
	RTLR(3,tr3);
	RTLIU(4);
	RTLU (SK_VOID, NULL);
	RTLU(SK_UINT8,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 871, Current, 0, 1, 14202);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(871, Current, 14202);
	RTIV(Current, RTAL);
	if (RTAL & CK_ENSURE) {
		in_assertion = ~0;
		RTE_OT
		tu1_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6416, dtype))(Current)).it_n1);
		tu1_1 = tu1_2;
		tr1 = NULL;
		RTE_O
		tr1 = RTLA;
		RTE_OE
		RTE_OT
		tu1_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6417, dtype))(Current)).it_n1);
		tu1_2 = tu1_3;
		tr2 = NULL;
		RTE_O
		tr2 = RTLA;
		RTE_OE
		RTE_OT
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6418, dtype))(Current)).it_n1);
		tu1_3 = tu1_4;
		tr3 = NULL;
		RTE_O
		tr3 = RTLA;
		RTE_OE
		in_assertion = 0;
	}
	RTHOOK(1);
	RTDBGAA(Current, dtype, 6428, 0x30000000, 1); /* alpha_internal */
	*(EIF_NATURAL_8 *)(Current + RTWA(6428, dtype)) = (EIF_NATURAL_8) arg1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(2);
		RTCT("set_alpha_is_set", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6419, dtype))(Current)).it_n1);
		if ((EIF_BOOLEAN)(tu1_4 == arg1)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(3);
		RTCT("set_alpha_red_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6416, dtype))(Current)).it_n1);
		RTCO(tr1);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_1)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(4);
		RTCT("set_alpha_green_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6417, dtype))(Current)).it_n1);
		RTCO(tr2);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_2)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(5);
		RTCT("set_alpha_blue_unchange", EX_POST);
		tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(6418, dtype))(Current)).it_n1);
		RTCO(tr3);
		if ((EIF_BOOLEAN)(tu1_4 == tu1_3)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

void EIF_Minit872 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
