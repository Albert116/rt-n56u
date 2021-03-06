/* BSD `_setjmp' entry point to `sigsetjmp (..., 0)'.  PowerPC version.
   Copyright (C) 1994, 1997, 1999, 2000 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */

/* This just does a tail-call to `__sigsetjmp (ARG, 0)'.
   We cannot do it in C because it must be a tail-call, so frame-unwinding
   in setjmp doesn't clobber the state restored by longjmp.  */

#include "ppc_asm.h"

.globl      _setjmp;
.type      _setjmp, @function;
.align  2;

_setjmp:
	li r4,0			/* Set second argument to 0.  */

	b __sigsetjmp@local

.size     _setjmp,.-_setjmp
