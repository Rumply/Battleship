/*
 * Code for class GAME_PIXEL_READER_WRITER
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F899_9355(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F899_9356(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern void F899_10121(EIF_REFERENCE, int);
extern void EIF_Minit899(void);

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

/* {GAME_PIXEL_READER_WRITER}.make */
void F899_9355 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x, EIF_TYPED_VALUE arg3x)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
#define arg1 arg1x.it_r
#define arg2 arg2x.it_i4
#define arg3 arg3x.it_i4
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_POINTER tp1;
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg3x.type & SK_HEAD) == SK_REF) arg3x.it_i4 = * (EIF_INTEGER_32 *) arg3x.it_r;
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_i4 = * (EIF_INTEGER_32 *) arg2x.it_r;
	
	RTLI(6);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLR(3,ur1);
	RTLR(4,tr2);
	RTLR(5,ur2);
	RTLIU(6);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU(SK_INT32,&arg2);
	RTLU(SK_INT32,&arg3);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 898, Current, 0, 3, 15056);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(898, Current, 15056);
	RTCC(arg1, 898, l_feature_name, 1, eif_new_type(914, 0x01), 0x01);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("not_indexed", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7456, "is_indexed", arg1))(arg1)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 7236, 0x10000000, 1); /* bytes_per_pixel */
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7534, "bytes_per_pixel", arg1))(arg1)).it_i4);
	*(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype)) = (EIF_INTEGER_32) ti4_1;
	RTHOOK(3);
	RTDBGAA(Current, dtype, 7232, 0xF8000392, 0); /* pixel_format */
	RTAR(Current, arg1);
	*(EIF_REFERENCE *)(Current + RTWA(7232, dtype)) = (EIF_REFERENCE) RTCCL(arg1);
	RTHOOK(4);
	RTDBGAA(Current, dtype, 7229, 0x10000000, 1); /* width */
	*(EIF_INTEGER_32 *)(Current + RTWA(7229, dtype)) = (EIF_INTEGER_32) arg2;
	RTHOOK(5);
	RTDBGAA(Current, dtype, 7230, 0x10000000, 1); /* height */
	*(EIF_INTEGER_32 *)(Current + RTWA(7230, dtype)) = (EIF_INTEGER_32) arg3;
	RTHOOK(6);
	RTDBGAA(Current, dtype, 7231, 0x10000000, 1); /* pitch */
	ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
	*(EIF_INTEGER_32 *)(Current + RTWA(7231, dtype)) = (EIF_INTEGER_32) (EIF_INTEGER_32) (arg2 * ti4_1);
	RTHOOK(7);
	RTDBGAA(Current, dtype, 7235, 0xF8000097, 0); /* internal_item */
	tr1 = RTLNSMART(RTWCT(7235, dtype, Dftype(Current)).id);
	ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype));
	ui4_1 = (EIF_INTEGER_32) ((EIF_INTEGER_32) (arg2 * arg3) * ti4_1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(2669, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(7,1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(7235, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(8);
	RTDBGAA(Current, dtype, 7233, 0x04000000, 1); /* is_valid */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(8,1);
	tp1 = *(EIF_POINTER *)(tr1 + RTVA(2675, "item", tr1));
	RTNHOOK(8,2);
	tb1 = !tp1;
	*(EIF_BOOLEAN *)(Current + RTWA(7233, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) !tb1;
	RTHOOK(9);
	tb1 = *(EIF_BOOLEAN *)(Current + RTWA(7233, dtype));
	if ((EIF_BOOLEAN) !tb1) {
		RTHOOK(10);
		tr1 = RTMS_EX_H("No more memory",14,904766585);
		ur1 = tr1;
		tr2 = RTMS_EX_H("Cannot allocate a pixel buffer",30,1241552498);
		ur2 = tr2;
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(6434, dtype))(Current, ur1x, ur2x);
	}
	if (RTAL & CK_ENSURE) {
		RTHOOK(11);
		RTCT("is_created", EX_POST);
		tb1 = '\01';
		tb2 = *(EIF_BOOLEAN *)(Current + RTWA(6441, dtype));
		if ((EIF_BOOLEAN) !tb2) {
			tp1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7228, dtype))(Current)).it_p);
			RTNHOOK(11,1);
			tb2 = !tp1;
			tb1 = (EIF_BOOLEAN) !tb2;
		}
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(12);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(5);
	RTEE;
#undef up1
#undef ur1
#undef ur2
#undef ui4_1
#undef arg3
#undef arg2
#undef arg1
}

/* {GAME_PIXEL_READER_WRITER}.pixel */
EIF_TYPED_VALUE F899_9356 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x)
{
	GTCX
	char *l_feature_name = "pixel";
	RTEX;
#define arg1 arg1x.it_i4
#define arg2 arg2x.it_i4
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE ui4_2x = {{0}, SK_INT32};
#define ui4_2 ui4_2x.it_i4
	EIF_INTEGER_32 ti4_1;
	EIF_BOOLEAN tb1;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_i4 = * (EIF_INTEGER_32 *) arg2x.it_r;
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,Result);
	RTLIU(2);
	RTLU (SK_REF, &Result);
	RTLU(SK_INT32,&arg1);
	RTLU(SK_INT32,&arg2);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 898, Current, 0, 2, 15057);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(898, Current, 15057);
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
	RTDBGAL(Current, 0, 0xF8000366, 0,0); /* Result */
	ui4_1 = arg1;
	ui4_2 = arg2;
	Result = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(7238, 897))(Current, ui4_1x, ui4_2x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(5);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(4);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
#undef ui4_1
#undef ui4_2
#undef arg2
#undef arg1
}

/* {GAME_PIXEL_READER_WRITER}._invariant */
void F899_10121 (EIF_REFERENCE Current, int where)
{
	GTCX
	char *l_feature_name = "_invariant";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_POINTER tp1;
	EIF_REFERENCE tr1 = NULL;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCDT;
	RTLD;
	RTDA;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLIU(2);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTEAINV(l_feature_name, 898, Current, 0, 10120);
	RTSA(dtype);
	RTME(dtype, 0);
	RTIT("null_means_invalid", Current);
	tb1 = '\01';
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	tp1 = *(EIF_POINTER *)(tr1 + RTVA(2675, "item", tr1));
	tb2 = !tp1;
	if (tb2) {
		tb2 = *(EIF_BOOLEAN *)(Current + RTWA(7233, dtype));
		tb1 = (EIF_BOOLEAN) !tb2;
	}
	if (tb1) {
		RTCK;
	} else {
		RTCF;
	}
	RTLO(2);
	RTMD(0);
	RTLE;
	RTEE;
#undef up1
}

void EIF_Minit899 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
