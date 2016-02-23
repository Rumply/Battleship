/*
 * Code for class GAME_PIXEL_WRITER
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F897_9353(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern void EIF_Minit897(void);

#ifdef __cplusplus
}
#endif

#include "eif_misc.h"

#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {GAME_PIXEL_WRITER}.set_pixel */
void F897_9353 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x, EIF_TYPED_VALUE arg3x)
{
	GTCX
	char *l_feature_name = "set_pixel";
	RTEX;
	EIF_NATURAL_32 loc1 = (EIF_NATURAL_32) 0;
	EIF_NATURAL_8 loc2 = (EIF_NATURAL_8) 0;
	EIF_NATURAL_8 loc3 = (EIF_NATURAL_8) 0;
	EIF_NATURAL_8 loc4 = (EIF_NATURAL_8) 0;
	EIF_NATURAL_8 loc5 = (EIF_NATURAL_8) 0;
	EIF_INTEGER_32 loc6 = (EIF_INTEGER_32) 0;
#define arg1 arg1x.it_r
#define arg2 arg2x.it_i4
#define arg3 arg3x.it_i4
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE uu4_1x = {{0}, SK_UINT32};
#define uu4_1 uu4_1x.it_n4
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_TYPED_VALUE uu1_1x = {{0}, SK_UINT8};
#define uu1_1 uu1_1x.it_n1
	EIF_TYPED_VALUE uu1_2x = {{0}, SK_UINT8};
#define uu1_2 uu1_2x.it_n1
	EIF_TYPED_VALUE uu1_3x = {{0}, SK_UINT8};
#define uu1_3 uu1_3x.it_n1
	EIF_TYPED_VALUE uu1_4x = {{0}, SK_UINT8};
#define uu1_4 uu1_4x.it_n1
	EIF_POINTER tp1;
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_NATURAL_32 tu4_1;
	EIF_NATURAL_32 tu4_2;
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_8 tu1_1;
	EIF_NATURAL_8 tu1_2;
	EIF_NATURAL_8 tu1_3;
	EIF_NATURAL_8 tu1_4;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg3x.type & SK_HEAD) == SK_REF) arg3x.it_i4 = * (EIF_INTEGER_32 *) arg3x.it_r;
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_i4 = * (EIF_INTEGER_32 *) arg2x.it_r;
	
	RTLI(3);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLIU(3);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU(SK_INT32,&arg2);
	RTLU(SK_INT32,&arg3);
	RTLU (SK_REF, &Current);
	RTLU(SK_UINT32, &loc1);
	RTLU(SK_UINT8, &loc2);
	RTLU(SK_UINT8, &loc3);
	RTLU(SK_UINT8, &loc4);
	RTLU(SK_UINT8, &loc5);
	RTLU(SK_INT32, &loc6);
	
	RTEAA(l_feature_name, 896, Current, 6, 3, 15053);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(896, Current, 15053);
	RTCC(arg1, 896, l_feature_name, 1, eif_new_type(870, 0x01), 0x01);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("is_item_valid", EX_PRE);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(7233, dtype));
		RTTE(tb1, label_1);
		RTCK;
		RTHOOK(2);
		RTCT("is_line_valid", EX_PRE);
		ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7230, dtype));
		RTTE((EIF_BOOLEAN) ((EIF_BOOLEAN) (arg2 >= ((EIF_INTEGER_32) 1L)) && (EIF_BOOLEAN) (arg2 <= ti4_1)), label_1);
		RTCK;
		RTHOOK(3);
		RTCT("is_column_valid", EX_PRE);
		ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7229, dtype));
		RTTE((EIF_BOOLEAN) ((EIF_BOOLEAN) (arg2 >= ((EIF_INTEGER_32) 1L)) && (EIF_BOOLEAN) (arg3 <= ti4_1)), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(4);
	RTDBGAL(Current, 6, 0x10000000, 1, 0); /* loc6 */
	loc6 = *(EIF_INTEGER_32 *)(Current + RTWA(7231, dtype));
	ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
	loc6 = (EIF_INTEGER_32) (EIF_INTEGER_32) ((EIF_INTEGER_32) ((EIF_INTEGER_32) (arg2 - ((EIF_INTEGER_32) 1L)) * loc6) + (EIF_INTEGER_32) ((EIF_INTEGER_32) (arg3 - ((EIF_INTEGER_32) 1L)) * ti4_1));
	RTHOOK(5);
	RTDBGAL(Current, 1, 0x38000000, 1, 0); /* loc1 */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7232, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(5,1);
	tp1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7538, "item", tr1))(tr1)).it_p);
	up1 = tp1;
	tu1_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(6416, "red", arg1))(arg1)).it_n1);
	uu1_1 = tu1_1;
	tu1_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(6417, "green", arg1))(arg1)).it_n1);
	uu1_2 = tu1_2;
	tu1_3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(6418, "blue", arg1))(arg1)).it_n1);
	uu1_3 = tu1_3;
	tu1_4 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(6419, "alpha", arg1))(arg1)).it_n1);
	uu1_4 = tu1_4;
	loc1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(5013, 863))(Current, up1x, uu1_1x, uu1_2x, uu1_3x, uu1_4x)).it_n4);
	RTHOOK(6);
	ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
	if ((EIF_BOOLEAN)(ti4_1 == ((EIF_INTEGER_32) 1L))) {
		RTHOOK(7);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(7,1);
		tu1_1 = (EIF_NATURAL_8) loc1;
		uu1_1 = tu1_1;
		ui4_1 = loc6;
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2698, "put_natural_8", tr1))(tr1, uu1_1x, ui4_1x);
	} else {
		RTHOOK(8);
		ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
		if ((EIF_BOOLEAN)(ti4_1 == ((EIF_INTEGER_32) 2L))) {
			RTHOOK(9);
			tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(9,1);
			tu2_1 = (EIF_NATURAL_16) loc1;
			uu2_1 = tu2_1;
			ui4_1 = loc6;
			(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2699, "put_natural_16", tr1))(tr1, uu2_1x, ui4_1x);
		} else {
			RTHOOK(10);
			ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
			if ((EIF_BOOLEAN)(ti4_1 == ((EIF_INTEGER_32) 3L))) {
				RTHOOK(11);
				tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1584, dtype))(Current)).it_b);
				if (tb1) {
					RTHOOK(12);
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(12,1);
					uu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 255L);
					tu4_1 = eif_bit_and(loc1,uu4_1);
					RTNHOOK(12,2);
					tu1_1 = (EIF_NATURAL_8) tu4_1;
					uu1_1 = tu1_1;
					ui4_1 = loc6;
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2698, "put_natural_8", tr1))(tr1, uu1_1x, ui4_1x);
					RTHOOK(13);
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(13,1);
					ui4_1 = ((EIF_INTEGER_32) 8L);
					tu4_1 = eif_bit_shift_right(loc1,ui4_1);
					RTNHOOK(13,2);
					uu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 255L);
					tu4_2 = eif_bit_and(tu4_1,uu4_1);
					RTNHOOK(13,3);
					tu1_1 = (EIF_NATURAL_8) tu4_2;
					uu1_1 = tu1_1;
					ui4_1 = (EIF_INTEGER_32) (loc6 + ((EIF_INTEGER_32) 1L));
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2698, "put_natural_8", tr1))(tr1, uu1_1x, ui4_1x);
					RTHOOK(14);
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(14,1);
					ui4_1 = ((EIF_INTEGER_32) 16L);
					tu4_1 = eif_bit_shift_right(loc1,ui4_1);
					RTNHOOK(14,2);
					uu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 255L);
					tu4_2 = eif_bit_and(tu4_1,uu4_1);
					RTNHOOK(14,3);
					tu1_1 = (EIF_NATURAL_8) tu4_2;
					uu1_1 = tu1_1;
					ui4_1 = (EIF_INTEGER_32) (loc6 + ((EIF_INTEGER_32) 2L));
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2698, "put_natural_8", tr1))(tr1, uu1_1x, ui4_1x);
				} else {
					RTHOOK(15);
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(15,1);
					ui4_1 = ((EIF_INTEGER_32) 16L);
					tu4_1 = eif_bit_shift_right(loc1,ui4_1);
					RTNHOOK(15,2);
					uu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 255L);
					tu4_2 = eif_bit_and(tu4_1,uu4_1);
					RTNHOOK(15,3);
					tu1_1 = (EIF_NATURAL_8) tu4_2;
					uu1_1 = tu1_1;
					ui4_1 = loc6;
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2698, "put_natural_8", tr1))(tr1, uu1_1x, ui4_1x);
					RTHOOK(16);
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(16,1);
					ui4_1 = ((EIF_INTEGER_32) 8L);
					tu4_1 = eif_bit_shift_right(loc1,ui4_1);
					RTNHOOK(16,2);
					uu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 255L);
					tu4_2 = eif_bit_and(tu4_1,uu4_1);
					RTNHOOK(16,3);
					tu1_1 = (EIF_NATURAL_8) tu4_2;
					uu1_1 = tu1_1;
					ui4_1 = (EIF_INTEGER_32) (loc6 + ((EIF_INTEGER_32) 1L));
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2698, "put_natural_8", tr1))(tr1, uu1_1x, ui4_1x);
					RTHOOK(17);
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(17,1);
					uu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 255L);
					tu4_1 = eif_bit_and(loc1,uu4_1);
					RTNHOOK(17,2);
					tu1_1 = (EIF_NATURAL_8) tu4_1;
					uu1_1 = tu1_1;
					ui4_1 = (EIF_INTEGER_32) (loc6 + ((EIF_INTEGER_32) 2L));
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2698, "put_natural_8", tr1))(tr1, uu1_1x, ui4_1x);
				}
			} else {
				RTHOOK(18);
				ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
				if ((EIF_BOOLEAN)(ti4_1 == ((EIF_INTEGER_32) 4L))) {
					RTHOOK(19);
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(19,1);
					uu4_1 = loc1;
					ui4_1 = loc6;
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(2700, "put_natural_32", tr1))(tr1, uu4_1x, ui4_1x);
				}
			}
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(20);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(11);
	RTEE;
#undef up1
#undef ui4_1
#undef uu4_1
#undef uu2_1
#undef uu1_1
#undef uu1_2
#undef uu1_3
#undef uu1_4
#undef arg3
#undef arg2
#undef arg1
}

void EIF_Minit897 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
