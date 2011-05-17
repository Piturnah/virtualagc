/*
  Copyright 2003,2004 Ronald S. Burkey <info@sandroid.org>
  
  This file is part of yaAGC. 

  yaAGC is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  yaAGC is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with yaAGC; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

  Filename:     ParseEBANK.c
  Purpose:     Assembles the EBANK= pseudo-op.
  Mode:        04/29/03 RSB.   Began.
               07/23/04 RSB.   Added SBANK.
*/

#include "yaYUL.h"
#include <stdlib.h>
#include <math.h>
#include <string.h>

//-------------------------------------------------------------------------
// Returns non-zero on unrecoverable error.
int ParseEBANK(ParseInput_t *InRecord, ParseOutput_t *OutRecord)
{
  ParseOutput_t Dummy;
  Address_t Address;
  int Value, i;

  OutRecord->Extend = InRecord->Extend;
  OutRecord->IndexValid = InRecord->IndexValid;
  OutRecord->Bank = InRecord->Bank;
  OutRecord->NumWords = 0;
  OutRecord->ProgramCounter = InRecord->ProgramCounter;

  if (*InRecord->Mod1)
    {
      strcpy(OutRecord->ErrorMessage, "Extra fields.");
      OutRecord->Warning = 1;
    }

  i = GetOctOrDec(InRecord->Operand, &Value);
  if (!i)
    {
      PseudoToSegmented(Value, &Dummy);
      Address = Dummy.ProgramCounter;

    DoIt:  
      if (Address.Invalid)
        {
          strcpy(OutRecord->ErrorMessage, "Destination address not resolved.");
          OutRecord->Fatal = 1; 
          return (0);
        }

      if (!Address.Erasable)
        {
          strcpy(OutRecord->ErrorMessage, "Destination not erasable.");
          OutRecord->Fatal = 1;
          return (0);
        }

      if (Address.SReg < 0 || Address.SReg > 01777)
        {
          strcpy(OutRecord->ErrorMessage, "Destination address out of range.");
          OutRecord->Fatal = 1;
          return (0);
        }

      OutRecord->Bank.LastEBank = OutRecord->Bank.CurrentEBank;
      OutRecord->Bank.CurrentEBank = Address;
      OutRecord->Bank.OneshotPending = 1;
      OutRecord->LabelValue = Address;
      OutRecord->LabelValueValid = 1;
    }
  else
    {
      // The operand is NOT a number.  Presumably, it's a symbol.
      i = FetchSymbolPlusOffset(&InRecord->ProgramCounter, InRecord->Operand, "", &Address);
      if (!i)
        {
          IncPc(&Address, OpcodeOffset, &Address);
          goto DoIt;
        }

      sprintf(OutRecord->ErrorMessage, "Symbol \"%s\" undefined or offset bad", InRecord->Operand);
      OutRecord->Fatal = 1;
    }

  //printf ("%o\n", OutRecord->Bank.CurrentSBank.Super);

  return (0);  
}

