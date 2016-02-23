/*
 * Code for class GAME_PIXEL_READER
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern EIF_TYPED_VALUE F898_9354(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern void EIF_Minit898(void);

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

/* {GAME_PIXEL_READER}.pixel */
EIF_TYPED_VALUE F898_9354 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x)
{
	GTCX
	char *l_feature_name = "pixel";
	RTEX;
	EIF_NATURAL_32 loc1 = (EIF_NATURAL_32) 0;
	EIF_NATURAL_8 loc2 = (EIF_NATURAL_8) 0;
	EIF_NATURAL_8 loc3 = (EIF_NATURAL_8) 0;
	EIF_NATURAL_8 loc4 = (EIF_NATURAL_8) 0;
	EIF_NATURAL_8 loc5 = (EIF_NATURAL_8) 0;
#define arg1 arg1x.it_i4
#define arg2 arg2x.it_i4
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE up3x = {{0}, SK_POINTER};
#define up3 up3x.it_p
	EIF_TYPED_VALUE up4x = {{0}, SK_POINTER};
#define up4 up4x.it_p
	EIF_TYPED_VALUE up5x = {{0}, SK_POINTER};
#define up5 up5x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE uu4_1x = {{0}, SK_UINT32};
#define uu4_1 uu4_1x.it_n4
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
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_INTEGER_32 ti4_2;
	EIF_NATURAL_32 tu4_1;
	EIF_NATURAL_32 tu4_2;
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_8 tu1_1;
	EIF_BOOLEAN tb1;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_i4 = * (EIF_INTEGER_32 *) arg2x.it_r;
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(6);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,tr2);
	RTLR(3,tr3);
	RTLR(4,ur1);
	RTLR(5,Result);
	RTLIU(6);
	RTLU (SK_REF, &Result);
	RTLU(SK_INT32,&arg1);
	RTLU(SK_INT32,&arg2);
	RTLU (SK_REF, &Current);
	RTLU(SK_UINT32, &loc1);
	RTLU(SK_UINT8, &loc2);
	RTLU(SK_UINT8, &loc3);
	RTLU(SK_UINT8, &loc4);
	RTLU(SK_UINT8, &loc5);
	
	RTEAA(l_feature_name, 897, Current, 5, 2, 15054);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(897, Current, 15054);
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
		RTTE((EIF_BOOLEAN) ((EIF_BOOLEAN) (arg1 >= ((EIF_INTEGER_32) 1L)) && (EIF_BOOLEAN) (arg1 <= ti4_1)), label_1);
		RTCK;
		RTHOOK(3);
		RTCT("is_column_valid", EX_PRE);
		ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7229, dtype));
		RTTE((EIF_BOOLEAN) ((EIF_BOOLEAN) (arg1 >= ((EIF_INTEGER_32) 1L)) && (EIF_BOOLEAN) (arg2 <= ti4_1)), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(4);
	ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
	if ((EIF_BOOLEAN)(ti4_1 == ((EIF_INTEGER_32) 1L))) {
		RTHOOK(5);
		RTDBGAL(Current, 1, 0x38000000, 1, 0); /* loc1 */
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		RTNHOOK(5,1);
		ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7231, dtype));
		ti4_2 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
		ui4_1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) ((EIF_INTEGER_32) (arg1 - ((EIF_INTEGER_32) 1L)) * ti4_1) + (EIF_INTEGER_32) ((EIF_INTEGER_32) (arg2 - ((EIF_INTEGER_32) 1L)) * ti4_2));
		tu1_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2678, "read_natural_8", tr1))(tr1, ui4_1x)).it_n1);
		RTNHOOK(5,2);
		tu4_1 = (EIF_NATURAL_32) tu1_1;
		loc1 = (EIF_NATURAL_32) tu4_1;
	} else {
		RTHOOK(6);
		ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
		if ((EIF_BOOLEAN)(ti4_1 == ((EIF_INTEGER_32) 2L))) {
			RTHOOK(7);
			RTDBGAL(Current, 1, 0x38000000, 1, 0); /* loc1 */
			tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
			RTNHOOK(7,1);
			ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7231, dtype));
			ti4_2 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
			ui4_1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) ((EIF_INTEGER_32) (arg1 - ((EIF_INTEGER_32) 1L)) * ti4_1) + (EIF_INTEGER_32) ((EIF_INTEGER_32) (arg2 - ((EIF_INTEGER_32) 1L)) * ti4_2));
			tu2_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2679, "read_natural_16", tr1))(tr1, ui4_1x)).it_n2);
			RTNHOOK(7,2);
			tu4_1 = (EIF_NATURAL_32) tu2_1;
			loc1 = (EIF_NATURAL_32) tu4_1;
		} else {
			RTHOOK(8);
			ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
			if ((EIF_BOOLEAN)(ti4_1 == ((EIF_INTEGER_32) 3L))) {
				RTHOOK(9);
				tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(1584, dtype))(Current)).it_b);
				if (tb1) {
					RTHOOK(10);
					RTDBGAL(Current, 1, 0x38000000, 1, 0); /* loc1 */
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(10,1);
					ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7231, dtype));
					ti4_2 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
					ui4_1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) ((EIF_INTEGER_32) (arg1 - ((EIF_INTEGER_32) 1L)) * ti4_1) + (EIF_INTEGER_32) ((EIF_INTEGER_32) (arg2 - ((EIF_INTEGER_32) 1L)) * ti4_2));
					tu4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2718, "read_natural_32_le", tr1))(tr1, ui4_1x)).it_n4);
					RTNHOOK(10,2);
					uu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 16777215L);
					tu4_2 = eif_bit_and(tu4_1,uu4_1);
					loc1 = (EIF_NATURAL_32) tu4_2;
				} else {
					RTHOOK(11);
					RTDBGAL(Current, 1, 0x38000000, 1, 0); /* loc1 */
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(11,1);
					ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7231, dtype));
					ti4_2 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
					ui4_1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) ((EIF_INTEGER_32) (arg1 - ((EIF_INTEGER_32) 1L)) * ti4_1) + (EIF_INTEGER_32) ((EIF_INTEGER_32) (arg2 - ((EIF_INTEGER_32) 1L)) * ti4_2));
					tu4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2738, "read_natural_32_be", tr1))(tr1, ui4_1x)).it_n4);
					RTNHOOK(11,2);
					ui4_1 = ((EIF_INTEGER_32) 8L);
					tu4_2 = eif_bit_shift_right(tu4_1,ui4_1);
					loc1 = (EIF_NATURAL_32) tu4_2;
				}
			} else {
				RTHOOK(12);
				ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
				if ((EIF_BOOLEAN)(ti4_1 == ((EIF_INTEGER_32) 4L))) {
					RTHOOK(13);
					RTDBGAL(Current, 1, 0x38000000, 1, 0); /* loc1 */
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(13,1);
					ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7231, dtype));
					ti4_2 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
					ui4_1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) ((EIF_INTEGER_32) (arg1 - ((EIF_INTEGER_32) 1L)) * ti4_1) + (EIF_INTEGER_32) ((EIF_INTEGER_32) (arg2 - ((EIF_INTEGER_32) 1L)) * ti4_2));
					tu4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(2680, "read_natural_32", tr1))(tr1, ui4_1x)).it_n4);
					loc1 = (EIF_NATURAL_32) tu4_1;
				}
			}
		}
	}
	RTHOOK(14);
	tr1 = RTMS_EX_H("Color: ",7,1451348512);
	tr2 = RTLN(eif_new_type(200, 0x00).id);
	*(EIF_NATURAL_32 *)tr2 = loc1;
	tr3 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(4057, "to_hex_string", tr2))(tr2)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr3);
	tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4421, "plus", tr1))(tr1, ur1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	tr1 = RTMS_EX_H("\012",1,10);
	ur1 = tr1;
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4421, "plus", tr2))(tr2, ur1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(30, dtype))(Current, ur1x);
	RTHOOK(15);
	uu4_1 = loc1;
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7232, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(15,1);
	tp1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7538, "item", tr1))(tr1)).it_p);
	up1 = tp1;
	up2 = (EIF_NATURAL_8 *) &(loc2);
	up3 = (EIF_NATURAL_8 *) &(loc3);
	up4 = (EIF_NATURAL_8 *) &(loc4);
	up5 = (EIF_NATURAL_8 *) &(loc5);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(5015, 863))(Current, uu4_1x, up1x, up2x, up3x, up4x, up5x);
	RTHOOK(16);
	RTDBGAL(Current, 0, 0xF8000366, 0,0); /* Result */
	tr1 = RTLN(eif_new_type(870, 0x01).id);
	uu1_1 = loc2;
	uu1_2 = loc3;
	uu1_3 = loc4;
	uu1_4 = loc5;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(6411, Dtype(tr1)))(tr1, uu1_1x, uu1_2x, uu1_3x, uu1_4x);
	RTNHOOK(16,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(17);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(9);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
#undef up2
#undef up3
#undef up4
#undef up5
#undef ur1
#undef ui4_1
#undef uu4_1
#undef uu1_1
#undef uu1_2
#undef uu1_3
#undef uu1_4
#undef arg2
#undef arg1
}

void EIF_Minit898 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
