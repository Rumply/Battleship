/*
 * Code for class GAME_KEY_STATE
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F877_9035(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F877_9036(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9037(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9038(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9039(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9040(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9041(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9042(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9043(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9044(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9045(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9046(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9047(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9048(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9049(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9050(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9051(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9052(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9053(EIF_REFERENCE);
extern EIF_TYPED_VALUE F877_9054(EIF_REFERENCE);
extern void EIF_Minit877(void);

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

/* {GAME_KEY_STATE}.make */
void F877_9035 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x, EIF_TYPED_VALUE arg3x, EIF_TYPED_VALUE arg4x)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
#define arg1 arg1x.it_i4
#define arg2 arg2x.it_i4
#define arg3 arg3x.it_n2
#define arg4 arg4x.it_n1
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg4x.type & SK_HEAD) == SK_REF) arg4x.it_n1 = * (EIF_NATURAL_8 *) arg4x.it_r;
	if ((arg3x.type & SK_HEAD) == SK_REF) arg3x.it_n2 = * (EIF_NATURAL_16 *) arg3x.it_r;
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_i4 = * (EIF_INTEGER_32 *) arg2x.it_r;
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_INT32,&arg1);
	RTLU(SK_INT32,&arg2);
	RTLU(SK_UINT16,&arg3);
	RTLU(SK_UINT8,&arg4);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 4, 14717);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(876, Current, 14717);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 6461, 0x10000000, 1); /* physical_code */
	*(EIF_INTEGER_32 *)(Current + RTWA(6461, dtype)) = (EIF_INTEGER_32) arg1;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 6460, 0x10000000, 1); /* virtual_code */
	*(EIF_INTEGER_32 *)(Current + RTWA(6460, dtype)) = (EIF_INTEGER_32) arg2;
	RTHOOK(3);
	RTDBGAA(Current, dtype, 6958, 0x30000000, 1); /* repeat */
	*(EIF_NATURAL_8 *)(Current + RTWA(6958, dtype)) = (EIF_NATURAL_8) arg4;
	RTHOOK(4);
	RTDBGAA(Current, dtype, 6959, 0x34000000, 1); /* modifier */
	*(EIF_NATURAL_16 *)(Current + RTWA(6959, dtype)) = (EIF_NATURAL_16) arg3;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(5);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(6);
	RTEE;
#undef arg4
#undef arg3
#undef arg2
#undef arg1
}

/* {GAME_KEY_STATE}.is_repeat */
EIF_TYPED_VALUE F877_9036 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_repeat";
	RTEX;
	EIF_NATURAL_8 tu1_1;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14718);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14718);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu1_1 = *(EIF_NATURAL_8 *)(Current + RTWA(6958, Dtype(Current)));
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu1_1 != (EIF_NATURAL_8) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {GAME_KEY_STATE}.has_no_modifier */
EIF_TYPED_VALUE F877_9037 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_no_modifier";
	RTEX;
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14719);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14719);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5770, 863))(Current)).it_n2);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_1 == tu2_2);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {GAME_KEY_STATE}.has_left_shift_modifier */
EIF_TYPED_VALUE F877_9038 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_left_shift_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14720);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14720);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5771, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_right_shift_modifier */
EIF_TYPED_VALUE F877_9039 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_right_shift_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14721);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14721);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5772, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_left_ctrl_modifier */
EIF_TYPED_VALUE F877_9040 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_left_ctrl_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14722);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14722);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5773, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_right_ctrl_modifier */
EIF_TYPED_VALUE F877_9041 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_right_ctrl_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14723);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14723);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5774, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_left_alt_modifier */
EIF_TYPED_VALUE F877_9042 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_left_alt_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14724);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14724);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5775, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_right_alt_modifier */
EIF_TYPED_VALUE F877_9043 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_right_alt_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14725);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14725);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5776, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_left_gui_modifier */
EIF_TYPED_VALUE F877_9044 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_left_gui_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14726);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14726);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5777, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_right_gui_modifier */
EIF_TYPED_VALUE F877_9045 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_right_gui_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14727);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14727);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5778, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_num_lock_modifier */
EIF_TYPED_VALUE F877_9046 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_num_lock_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14728);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14728);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5779, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_caps_lock_modifier */
EIF_TYPED_VALUE F877_9047 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_caps_lock_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14729);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14729);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5780, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_alt_gr_modifier */
EIF_TYPED_VALUE F877_9048 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_alt_gr_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14730);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14730);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5781, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_ctrl_modifier */
EIF_TYPED_VALUE F877_9049 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_ctrl_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14731);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14731);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5782, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_shift_modifier */
EIF_TYPED_VALUE F877_9050 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_shift_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14732);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14732);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5783, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_alt_modifier */
EIF_TYPED_VALUE F877_9051 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_alt_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14733);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14733);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5784, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.has_gui_modifier */
EIF_TYPED_VALUE F877_9052 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "has_gui_modifier";
	RTEX;
	EIF_TYPED_VALUE uu2_1x = {{0}, SK_UINT16};
#define uu2_1 uu2_1x.it_n2
	EIF_NATURAL_16 tu2_1;
	EIF_NATURAL_16 tu2_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 876, Current, 0, 0, 14714);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(876, Current, 14714);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tu2_1 = *(EIF_NATURAL_16 *)(Current + RTWA(6959, Dtype(Current)));
	tu2_2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(5785, 863))(Current)).it_n2);
	uu2_1 = tu2_2;
	tu2_2 = eif_bit_or(tu2_1,uu2_1);
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu2_2 != (EIF_NATURAL_16) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef uu2_1
}

/* {GAME_KEY_STATE}.repeat */
EIF_TYPED_VALUE F877_9053 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT8;
	r.it_n1 = *(EIF_NATURAL_8 *)(Current + RTWA(6958,Dtype(Current)));
	return r;
}


/* {GAME_KEY_STATE}.modifier */
EIF_TYPED_VALUE F877_9054 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT16;
	r.it_n2 = *(EIF_NATURAL_16 *)(Current + RTWA(6959,Dtype(Current)));
	return r;
}


void EIF_Minit877 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
