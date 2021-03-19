// Timer is open source under the MIT License.
//
// TERMS OF USE - Timer MODULE
//
// Copyright (c) 2017-present Ivan Mogilko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//////////////////////////////////////////////////////////////////////////////////////////
//
// Module implements Timer class.
//
// This module does not use built-in AGS timers in any way, and has its own limit of
// simultaneously running timmers.
//
// Timer's timeout can be defined in game ticks or real time.
// Timer can be tagged as "local", restricted to the room it created in, that either
// pause or stop completely when that room is unloaded (and may resume upon return).
// Timer can be paused and resumed at will, also told to pause and resume with game.
//
//////////////////////////////////////////////////////////////////////////////////////////
 
#ifndef __TIMER_MODULE__
#define __TIMER_MODULE__

#define TIMER_VERSION_00_00_90_00

// Maximal number of simultaneously running timers (not related to built-in AGS limit).
#define MAX_RUNNING_TIMERS 20

// Local timer behavior when room has changed
enum LocalTimerBehavior
{
  eTimerPause, 
  eTimerStop
};

// Flags determining the reason for timer's pause (can be combined using bitwise OR)
#define TIMER_PAUSED_BY_USER 1
#define TIMER_PAUSED_BY_GAME 2
#define TIMER_PAUSED_BY_ROOM 4


///////////////////////////////////////////////////////////////////////////////
//
// Managed Timer class.
//
///////////////////////////////////////////////////////////////////////////////
managed struct Timer
{
  //
  // General operations.
  //
  
  /// Start the timer, giving timeout in game ticks.
  import static Timer *Start(int timeout, RepeatStyle repeat = eOnce);
  /// Start the timer, giving timeout in real time (seconds).
  /// Remember that timer can be only as precise as your GameSpeed (40 checks per
  /// second, or 0.025s by default).
  import static Timer *StartRT(float timeout_s, RepeatStyle repeat = eOnce);
  /// Starts local timer working in game ticks, that may be paused when player leaves the room
  import static Timer *StartLocal(int timeout, LocalTimerBehavior on_leave = eTimerStop, RepeatStyle repeat = eOnce);
  /// Starts local timer working in real time (seconds), that may be paused when player leaves the room
  import static Timer *StartLocalRT(float timeout_s, LocalTimerBehavior on_leave = eTimerStop, RepeatStyle repeat = eOnce);
  
  /// Tells whether timer has JUST expired. Safe to pass null-pointer.
  import static bool   IsExpired(Timer *t);
  /// Stops the running timer. Safe to pass null-pointer.
  import static void   Stop(Timer *t);
  /// Pause the running timer. Safe to pass null-pointer.
  import static void   Pause(Timer *t);
  /// Resume the running timer. Safe to pass null-pointer.
  import static void   Resume(Timer *t);
  
  //
  // Additional setup.
  //
  
  /// Gets/sets whether all timers should pause when game is paused
  import static attribute bool    AllPauseWithGame;
  /// Gets/sets whether this particular timer should pause when game is paused
  import attribute bool           PauseWithGame;
  /// Gets the home room of the local timer (returns -1 if timer is global)
  import readonly attribute int   HomeRoom;
  /// Gets what this timer should do when home room gets unloaded
  import readonly attribute LocalTimerBehavior WhenLeavingRoom;
  
  //
  // Current state inspection.
  //
  
  /// Tells whether timer is currently active (counting down).
  import readonly attribute bool  IsActive;
  /// Signal property telling that the timer has expired. This flag will remain set
  /// for one game tick only and self-reset afterwards.
  import readonly attribute bool  EvtExpired;
  
  /// Gets whether this timer is working in real-time
  import readonly attribute bool  IsRealtime;
  /// Gets the timer's timeout in game ticks
  import readonly attribute int   TimeoutTicks;
  /// Gets the timer's timeout in real-time (considering current game speed)
  import readonly attribute float TimeoutSeconds;
  /// Gets the remaining time in current game ticks
  import readonly attribute int   RemainingTicks;
  /// Gets the remaining time in real-time (considering current game speed)
  import readonly attribute float RemainingSeconds;
  /// Gets current timer's paused state (0 - working, >= 1 - suspended)
  import readonly attribute int   IsPaused;
  
  
  //
  // Internal data.
  //
  
  protected int   _id; // internal ID of the timer
  protected bool  _realtime; // is timeout in seconds (otherwise in game ticks)
  protected float _timeout; // timeout (ticks or ms)
  protected bool  _repeat; // should auto-repeat or not
  protected float _remains; // time remaining (ticks or seconds)
  protected bool  _evt; // expired event flag
  protected int   _paused; // if the timer is paused
  
  protected bool  _pauseWithGame; // if the timer paused
  protected int   _room; // if the timer paused
  protected LocalTimerBehavior _whenLeavingRoom; // what local timer does when its room gets unloaded
};

#endif  // __TIMER_MODULE__