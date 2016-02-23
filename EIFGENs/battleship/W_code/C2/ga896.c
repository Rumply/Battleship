/*
 * Code for class GAME_PIXEL_BUFFER
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F896_9343(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F896_9344(EIF_REFERENCE);
extern EIF_TYPED_VALUE F896_9345(EIF_REFERENCE);
extern EIF_TYPED_VALUE F896_9346(EIF_REFERENCE);
extern EIF_TYPED_VALUE F896_9347(EIF_REFERENCE);
extern EIF_TYPED_VALUE F896_9348(EIF_REFERENCE);
extern EIF_TYPED_VALUE F896_9349(EIF_REFERENCE);
extern void F896_9350(EIF_REFERENCE);
extern EIF_TYPED_VALUE F896_9351(EIF_REFERENCE);
extern EIF_TYPED_VALUE F896_9352(EIF_REFERENCE);
extern void F896_10120(EIF_REFERENCE, int);
extern void EIF_Minit896(void);

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

/* {GAME_PIXEL_BUFFER}.make */
void F896_9343 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x, EIF_TYPED_VALUE arg3x, EIF_TYPED_VALUE arg4x, EIF_TYPED_VALUE arg5x)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_p
#define arg2 arg2x.it_r
#define arg3 arg3x.it_i4
#define arg4 arg4x.it_i4
#define arg5 arg5x.it_i4
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_POINTER tp1;
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg5x.type & SK_HEAD) == SK_REF) arg5x.it_i4 = * (EIF_INTEGER_32 *) arg5x.it_r;
	if ((arg4x.type & SK_HEAD) == SK_REF) arg4x.it_i4 = * (EIF_INTEGER_32 *) arg4x.it_r;
	if ((arg3x.type & SK_HEAD) == SK_REF) arg3x.it_i4 = * (EIF_INTEGER_32 *) arg3x.it_r;
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_p = * (EIF_POINTER *) arg1x.it_r;
	
	RTLI(3);
	RTLR(0,arg2);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLIU(3);
	RTLU (SK_VOID, NULL);
	RTLU(SK_POINTER,&arg1);
	RTLU(SK_REF,&arg2);
	RTLU(SK_INT32,&arg3);
	RTLU(SK_INT32,&arg4);
	RTLU(SK_INT32,&arg5);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	
	RTEAA(l_feature_name, 895, Current, 2, 5, 15042);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(895, Current, 15042);
	RTCC(arg2, 895, l_feature_name, 2, eif_new_type(914, 0x01), 0x01);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("exists", EX_PRE);
		tb1 = !arg1;
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTHOOK(2);
		RTCT("not_indexed", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7456, "is_indexed", arg2))(arg2)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(3);
	RTDBGAA(Current, dtype, 7235, 0xF8000097, 0); /* internal_item */
	tr1 = RTLNSMART(RTWCT(7235, dtype, Dftype(Current)).id);
	up1 = arg1;
	ui4_1 = (EIF_INTEGER_32) (arg4 * arg5);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(2672, Dtype(tr1)))(tr1, up1x, ui4_1x);
	RTNHOOK(3,1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(7235, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(4);
	RTDBGAA(Current, dtype, 7229, 0x10000000, 1); /* width */
	*(EIF_INTEGER_32 *)(Current + RTWA(7229, dtype)) = (EIF_INTEGER_32) arg3;
	RTHOOK(5);
	RTDBGAA(Current, dtype, 7230, 0x10000000, 1); /* height */
	*(EIF_INTEGER_32 *)(Current + RTWA(7230, dtype)) = (EIF_INTEGER_32) arg4;
	RTHOOK(6);
	RTDBGAA(Current, dtype, 7231, 0x10000000, 1); /* pitch */
	*(EIF_INTEGER_32 *)(Current + RTWA(7231, dtype)) = (EIF_INTEGER_32) arg5;
	RTHOOK(7);
	RTDBGAA(Current, dtype, 7232, 0xF8000392, 0); /* pixel_format */
	RTAR(Current, arg2);
	*(EIF_REFERENCE *)(Current + RTWA(7232, dtype)) = (EIF_REFERENCE) RTCCL(arg2);
	RTHOOK(8);
	RTDBGAA(Current, dtype, 7236, 0x10000000, 1); /* bytes_per_pixel */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7232, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(8,1);
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7534, "bytes_per_pixel", tr1))(tr1)).it_i4);
	*(EIF_INTEGER_32 *)(Current + RTWA(7236, dtype)) = (EIF_INTEGER_32) ti4_1;
	RTHOOK(9);
	RTDBGAA(Current, dtype, 7233, 0x04000000, 1); /* is_valid */
	*(EIF_BOOLEAN *)(Current + RTWA(7233, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(10);
		RTCT("item_not_null", EX_POST);
		tp1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7228, dtype))(Current)).it_p);
		RTNHOOK(10,1);
		tb1 = !tp1;
		if ((EIF_BOOLEAN) !tb1) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(11);
		RTCT("item_set", EX_POST);
		tp1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7228, dtype))(Current)).it_p);
		if ((tp1 == arg1)) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(12);
		RTCT("item_valid", EX_POST);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(7233, dtype));
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(13);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(9);
	RTEE;
#undef up1
#undef ui4_1
#undef arg5
#undef arg4
#undef arg3
#undef arg2
#undef arg1
}

/* {GAME_PIXEL_BUFFER}.item */
EIF_TYPED_VALUE F896_9344 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "item";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_POINTER tp1;
	EIF_REFERENCE tr1 = NULL;
	EIF_BOOLEAN tb1;
	EIF_POINTER Result = ((EIF_POINTER) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLIU(2);
	RTLU (SK_POINTER, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 895, Current, 0, 0, 15043);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(895, Current, 15043);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("pointer_valid", EX_PRE);
		tb1 = *(EIF_BOOLEAN *)(Current + RTWA(7233, dtype));
		RTTE(tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAL(Current, 0, 0x40000000, 1,0); /* Result */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7235, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(2,1);
	tp1 = *(EIF_POINTER *)(tr1 + RTVA(2675, "item", tr1));
	Result = (EIF_POINTER) tp1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_POINTER; r.it_p = Result; return r; }
#undef up1
}

/* {GAME_PIXEL_BUFFER}.width */
EIF_TYPED_VALUE F896_9345 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = *(EIF_INTEGER_32 *)(Current + RTWA(7229,Dtype(Current)));
	return r;
}


/* {GAME_PIXEL_BUFFER}.height */
EIF_TYPED_VALUE F896_9346 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = *(EIF_INTEGER_32 *)(Current + RTWA(7230,Dtype(Current)));
	return r;
}


/* {GAME_PIXEL_BUFFER}.pitch */
EIF_TYPED_VALUE F896_9347 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = *(EIF_INTEGER_32 *)(Current + RTWA(7231,Dtype(Current)));
	return r;
}


/* {GAME_PIXEL_BUFFER}.pixel_format */
EIF_TYPED_VALUE F896_9348 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(7232,Dtype(Current)));
	return r;
}


/* {GAME_PIXEL_BUFFER}.is_valid */
EIF_TYPED_VALUE F896_9349 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_BOOL;
	r.it_b = *(EIF_BOOLEAN *)(Current + RTWA(7233,Dtype(Current)));
	return r;
}


/* {GAME_PIXEL_BUFFER}.close */
void F896_9350 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "close";
	RTEX;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 895, Current, 0, 0, 15049);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(895, Current, 15049);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, Dtype(Current), 7233, 0x04000000, 1); /* is_valid */
	*(EIF_BOOLEAN *)(Current + RTWA(7233, Dtype(Current))) = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {GAME_PIXEL_BUFFER}.internal_item */
EIF_TYPED_VALUE F896_9351 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(7235,Dtype(Current)));
	return r;
}


/* {GAME_PIXEL_BUFFER}.bytes_per_pixel */
EIF_TYPED_VALUE F896_9352 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = *(EIF_INTEGER_32 *)(Current + RTWA(7236,Dtype(Current)));
	return r;
}


/* {GAME_PIXEL_BUFFER}._invariant */
void F896_10120 (EIF_REFERENCE Current, int where)
{
	GTCX
	char *l_feature_name = "_invariant";
	RTEX;
	EIF_POINTER tp1;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	RTCDT;
	RTLD;
	RTDA;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTEAINV(l_feature_name, 895, Current, 0, 10119);
	RTSA(dtype);
	RTME(dtype, 0);
	RTIT("exists", Current);
	tb1 = '\01';
	tb2 = *(EIF_BOOLEAN *)(Current + RTWA(6441, dtype));
	if ((EIF_BOOLEAN) !tb2) {
		tp1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7228, dtype))(Current)).it_p);
		tb2 = !tp1;
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
}

void EIF_Minit896 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
